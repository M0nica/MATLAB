function [ output_args ] = processOrders( bids, asks )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%--this stuff should go in original file
%-it should output a figure with printbook 
printBook(bids,asks)
pause(3)
clear %--in order have a clean slate for new order book)
printBook(newBids, newAsks, 0)
%--this function will be called in the original file

depth, must specify the depth of orderbook 

use text command to figure out how to position data in order book
use a for command
on the bid side , you run through the command up until the depth
you've indicated for the bid, you can convert numbers to string (sprintf), 
determine ho a number gets converted into a string

figure out how to use set, box and axis to get rid of extra lines on order book 


end

