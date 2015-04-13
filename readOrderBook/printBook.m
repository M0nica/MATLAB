function [ output_args ] = printBook( bids, asks )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%--this stuff should go in original file
%-it should output a figure with printbook 

%--this function will be called in the original file

%--depth of order book = 12 --%

depth = 12;

% if length(bids) == 0
%     depthB = 12;
% 
%    
% elseif length(bids) < 12 && length(bids) > 0
% depthB = length(bids);
% 
% else
% depthB = 12;
% end
% 
% %--depth of order book = 12 --%
% 
% if length(asks) == 0
%     depthA = 12;
%    
% elseif length(asks) < 12 && length(asks) > 0
% depthA = length(asks);
% 
% else
% depthA = 12;
% end
% 



%--clear existing figure--%
clf

axis off;

text(.15,1,'Bids') 
text(.1,.95,'Price') 
text(.2,.95,'Quantity') 


text(.55,1,'Asks') 
text(.5,.95,'Price') 
text(.6,.95,'Quantity') 



%--bids--%

%-- for i = 1:max(depthB)
for i = 1:min(depth, length(bids))
     %--quantity to integer--%
    quantity = sprintf('%d', round(bids(i,2)))
text(.2,(.9 - i/10), quantity)
  
    %--price to string--%
    price = sprintf('%.2f', bids(i,1))
      text(.1,(.9 - i/10) , price)
   
    
    
 end
 
  

%--asks--%
%-- for i = 1:max(depthA)
     for i = 1:min(depth, length(asks))
     %--quantity to integer--%
    quantity = sprintf('%d', round(asks(i,2)))
text(.6,(.9 - i/10), quantity)
  
    %--price to string--%
    price = sprintf('%.2f', asks(i,1))
      text(.5,(.9 - i/10) , price)
   
    
    
 end



end

