filename = 'orderbook320.csv';

%--M stores the order book--%
M = csvread(filename);

%--colon tells the program to read all rows--%
%but only the first two columns--%
bids = M(:,1:2);


asks = M(:,3:4);

%--changes the format show that exponents are not shown--%
%--will display in a better easier to read view--%
format shortg

disp('bids')
disp(bids)


disp('asks')
disp(asks)

 
