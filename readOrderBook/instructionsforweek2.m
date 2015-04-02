%--print order book, and then process order book and then print the updated
%order book--%


%--you must tell it how many rows of the orderbook to print--%
%--10-12 rows at most--%

printBook(bids,asks)
pause(3)
printBook(newBids, newAsks, 0)

later we can process multiple orderscoming into the market

functon is a particular type of program thatt takes input and has an output

depth, must specify the depth of orderbook 

use text command to figure out how to position data in order book
use a for command
on the bid side , you run through the command up until the depth
you've indicated for the bid, you can convert numbers to string (sprintf), 
determine ho a number gets converted into a string

figure out how to use set, box and axis to get rid of extra lines on order book 