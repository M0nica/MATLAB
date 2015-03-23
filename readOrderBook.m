filename = 'orderbook320.csv';
M = csvread(filename);
bids = M(:,1-2)
asks = M(:,3-4)
disp(bids)
disp(asks)