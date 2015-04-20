clear 

format shortg

rng(1)    
mindis = 40;
maxdis = 60;
totalOrders = 10;
newOrderPrice = round(mindis+20 * rand,2)
newQuantity = round(50 + 100*rand)
typeGenerator =round(rand)

intrinsicValue = ((mindis + maxdis) /2);
if typeGenerator <= 0.5
        newType = 'bid'
    else
        newType = 'ask'
    end


asks = zeros(0,2);
bids = zeros(0,2);
trades = zeros(0,2);



  
writerObj = VideoWriter('orderbook');
 writerObj.FrameRate = 2;
 open(writerObj);
rng(1)
for i=1:totalOrders

newOrderPrice = round(mindis+20 * rand,2)
newQuantity = round(50 + 100*rand)
typeGenerator =round(rand)


if typeGenerator <= 0.5
        newType = 'bid'
    else
        newType = 'ask'
    end



            
    [ nTrades, bids, asks ] = execute (bids, asks, newOrderPrice, newQuantity, newType);
           
        
   trades = [trades; nTrades];
  
            
   
    printBook(bids, asks)
    pause(1);
    
    F = getframe;
    writeVideo(writerObj, F);

end
 
 
 close(writerObj);

%--create vector of prices--%
prices= zeros(0,1);
for i=1:size(trades,1)
    prices=[prices; repmat(trades(i,1), trades(i,2),1)];
end

M = mean(prices)
S = std(prices)
%--volumes??
%--H = histogram(prices)
