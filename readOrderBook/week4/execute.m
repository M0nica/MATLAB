function[ trades, bids, asks ] = execute (bids, asks, newOrderPrice, newQuantity, newType);

%--intial value of unmet shares--&
unmet = newQuantity
%--addsd bids and trades to the order book
trades = zeros(0,2);


%--look at the first column of asks, to find all compatible orders --%
compatibleAsks = find(asks(:, 1) <= newOrderPrice);

%--look at the first column of bids, to find all compatible orders --%
compatibleBids = find(bids(:, 1) >= newOrderPrice);

if newType == 'bid'
    if compatibleAsks > 0
        %--keeps going until the largest number in compatible is
        %displayed--%
        for i = 1:max(compatibleAsks)
            %--orders that can be met that are currently umnmet--%
            volume = min(unmet, asks(i,2))
            if volume > 0
                
                %-- quantity of shares traded--
                %--nTrades = [nTrades; [asks(i,1) volume]]
                trades = [trades; [asks(i,1) volume]]
                unmet = unmet - volume
                
                %--updates the 2nd column (quantity) of compatible asks to,
                %-- removes the amount that has been fulfilled--%
                
                asks(i,2) = asks (i,2) - volume
            end
        end
    end
    
    %--if a bid order is not completly filled--%
    %--bid side needs to be updated--%
    if unmet > 0
        
        dummy = 9999
        
        %--adding to bids the unmet quantity--%
        bids = [bids; [newOrderPrice unmet]]
        
        %--sorted in decreasing order--%
        
        bids = sortrows(bids, -1)
        
        %get rid of excess zeroes--%
        
        asks = asks(asks(:,2) > 0,:)
        
        
        
        
    end
    
    %--this goes through the already sorted bids to detect duplicate
    %prices and combine their quantities--%
    
    for j = 1:size(bids,1)-1;
        if bids(j,1)==bids(j+1,1);
            bids(j,2)=bids(j,2)+bids(j+1,2);
            bids(j+1,2)=0;
        end
    end
    
    
    
    
    
    
    
    
    
    
    
    
    
    %--TYPE != bids, SECOND HALF OF PROGRAM for asks--%
    
else
    if compatibleBids > 0
        %--keeps going until the largest number in compatible is
        %displayed--%
        for i = 1:max(compatibleBids)
            %--orders that can be met that are currently umnmet--%
            volume = min(unmet, bids(i,2))
            if volume > 0
                
                %-- quantity of shares traded--
                trades = [trades; [bids(i,1) volume]]
                %--  trades = [trades; [bids(i,1) volume]]
                unmet = unmet - volume
                
                %--updates the 2nd column (quantity) of compatible bids to,
                %-- removes the amount that has been fulfilled--%
                
                
                bids(i,2) = bids (i,2) - volume
            end
        end
    end
    
    %--if a asks order is not completly filled--%
    %--asks side needs to be updated--%
    if unmet > 0
        
        %--adding to asks the unmet quantity--%
        asks = [asks; [newOrderPrice unmet]];
        
        %--sorted asks in decreasing order--%
        
        asks = sortrows(asks, 1);
        
        
        %             Now after your order has executed, you may end up with some
        % rows in bids with zero quantity. How do you get rid of these?
        % You can use the following command:
        
        bids = bids(bids(:,2) > 0,:);
        asks = asks(asks(:,2) > 0,:);
        
    end
    
    %--this goes through the already sorted asks to detect duplicate
    %prices and combine their quantities--%
    
    for j = 1:size(asks,1)-1;
        if asks(j,1)==asks(j+1,1);
            asks(j,2)=asks(j,2)+asks(j+1,2);
            asks(j+1,2)=0;
        end
    end
    
    
    
    
    
    
end

%--this removes any rows with zeros--%
bids = bids(bids(:,2) > 0,:);
asks = asks(asks(:,2) > 0,:);

disp('updated asks:')
disp(asks)

disp('updated bids:')
disp(bids)






end

