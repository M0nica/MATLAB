filename = 'orderbook320.csv';

%--M stores the order book--%
orderbook = csvread(filename);

%--colon tells the program to read all rows--%
%but only the first two columns--%
bids = orderbook(:,1:2)
asks = orderbook(:,3:4)

%--changes the format show that exponents are not shown--%
%--will display in a better easier to read view--%
format shortg

% disp('bids')
% disp(bids)
% 
% 
% disp('asks')
% disp(asks)

%--newOrderPrice;
%--newQuantity;
%--newType;

%--define trades ,a matrix with 2 columns and 0 rows --%
%--one for price and one for quantity--%
%--filled with zeroes for every entry--%
%--spell zereos without an e--%
trades = zeros(0,2);

%--info for a new order--%
%--play around w/ different #s here --%
newOrderPrice = 33.54
newQuantity = 3600
%--new type can equal ask--%
newType = 'bid'

%--intial value of unmet shares--&
unmet = newQuantity

%--look at the first column of asks, to find all compatible orders --%
compatibleAsks = find(asks(:, 1) <= newOrderPrice);


%--look at the first column of bids, to find all compatible orders --%
compatibleBids = find(bids(:, 1) >= newOrderPrice);


% --sum of shares in compatible asks--%
% availableAsks = sum(asks(compatible,2))
%
% --tradeQ  = minimum of demand--%
% tradeQuantity = min (newQuantity, availableAsks)
% --tradeP is the price at which trade will occur--%
% tradePrice = asks(1,1);
%
% -- trade matrix is initialized--%
% trades = [trades; [tradePrice tradeQuantity]]

if newType == 'bid'
    if compatibleAsks > 0
        %--keeps going until the largest number in compatible is
        %displayed--%
        for i = 1:max(compatibleAsks)
            %--orders that can be met that are currently umnmet--%
            volume = min(unmet, asks(i,2))
            if volume > 0
                
                %-- quantity of shares traded--
                trades = [trades; [asks(i,1) volume]]
                unmet = unmet - volume
                
                %--updates the 2nd column (quantity) of compatible asks to,
                %-- removes the amount that has been fulfilled--%
                
                
                asks(i,2) = asks (i,2) - volume
            end
        end
        
        %--if a bid order is not completly filled--%
        %--bid side needs to be updated--%
        if unmet > 0
            
            %--adding to bids the unmet quantity--%
            bids = [bids; [newOrderPrice unmet]]
            
            %--sorted in decreasing order--%
            
            bids = sortrows(bids, -1)
            
%             Now after your order has executed, you may end up with some 
% rows in asks with zero quantity. How do you get rid of these? 
% You can use the following command:

          asks = asks(asks(:,2) > 0,:)


          
     
        end
        
        %--this goes through the already sorted bids to detect duplicate
        %prices and combine their quantities--%
            
        for j = 1:length(bids)-1;
            if bids(j,1)==bids(j+1,1);
                bids(j,2)=bids(j,2)+bids(j+1,2);
                bids(j+1,2)=0;
            end
        end
        
        %-- asks = orderbook(:,3:4);
        disp(asks)
        disp(bids)
        
        %--  bids = orderbook(:,1:2);
        
        
        
    end
    
    if unmet == 0
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
                unmet = unmet - volume
                
                %--updates the 2nd column (quantity) of compatible bids to,
                %-- removes the amount that has been fulfilled--%
                
                
                bids(i,2) = bids (i,2) - volume
            end
        end
        
        %--if a asks order is not completly filled--%
        %--asks side needs to be updated--%
        if unmet > 0
            
            %--adding to asks the unmet quantity--%
            asks = [asks; [newOrderPrice unmet]]
            
            %--sorted asks in decreasing order--%
            
            asks = sortrows(asks, -1)
          
            
            %             Now after your order has executed, you may end up with some 
% rows in bids with zero quantity. How do you get rid of these? 
% You can use the following command:

          bids = bids(bids(:,2) > 0,:)
     
        end
        
        %--this goes through the already sorted asks to detect duplicate
        %prices and combine their quantities--%
            
        for j = 1:length(asks)-1;
            if asks(j,1)==asks(j+1,1);
                asks(j,2)=asks(j,2)+asks(j+1,2);
                asks(j+1,2)=0;
            end
        end
        
        %-- asks = orderbook(:,3:4);
        disp('updated asks:')
        disp(asks)
        
        disp('updated bids:')
        disp(bids)
        
        %--  bids = orderbook(:,1:2);
        
        
        
    end
    
   
    
    
end


