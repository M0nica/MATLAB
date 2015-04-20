clear 


asks = zeros(0,2);
bids = zeros(0,2);
trades = zeros(0,2);


%--changes the format show that exponents are not shown--%
%--will display in a better easier to read view--%
format shortg


rng(1)    
mindis = 40;
maxdix=60;
newOrderPrice = round(mindis+(20*rand),2)
%--newQuantity = round(3000+rand*10)
newQuantity = round(50 + 100*rand)
typeGenerator =round(rand)


   
totalOrders = 1;


writerObj = VideoWriter('orderbook');
writerObj.FrameRate = 2;
open(writerObj);


for i=1:totalOrders
      
%--newOrderPrice = round(33+rand*20,2)
%--newQuantity = round(3000+rand*10)
typeGenerator =rand

%--typeGenerator =round(rand)

    if typeGenerator <= 0.5
        newType = 'bid'
    else
        newType = 'ask'
    end
    
   
            
    [ nTrades, nBids, nAsks ] = execute (bids, asks, newOrderPrice, newQuantity, newType);
           
    bids = nBids;
    asks = nAsks;
    trades = [trades; nTrades];
           
            
   
    printBook(bids, asks)
    pause(1);
    F = getframe;
    writeVideo(writerObj, F);

end

close(writerObj)

%--create vector of prices--%
prices= zeros(0,1);
for i=1:size(trades,1)
    prices=[prices; repmat(trades(i,1), trades(i,2),1)];
end

M = mean(prices);
S = std(prices);
%--volumes??
%--H = histogram (prices)
