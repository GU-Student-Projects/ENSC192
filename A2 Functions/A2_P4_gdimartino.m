function [evenNumbers,oddNumbers,reverseNumbers] = A2_P4_gdimartino(endValue)
% FUNCTION_NAME - Transform Arrays
% Assignment: A2_Problem_4
%
% Inputs: Endvalue
% Outputs: Odd numbers, even numbers, reverse numbers
%
% Author: Gabe DiMartino
% Date: 02/5/2023; Last revision: 5-February-2023
%------------- BEGIN CODE --------------

% Define the range of numbers using linspace
endValueArray = linspace(1,endValue,endValue);

% Create a logical array based on the remainder of dividing each number by 2
evenOdd = logical(rem(endValueArray,2));

% Create arrays of odd numbers and even numbers using logical indexing
oddNumbers = endValueArray(evenOdd);
evenNumbers = endValueArray(~evenOdd);

% Create the reverse of the endValueArray
reverseNumbers = flip(endValueArray);

% Display the arrays of odd numbers, even numbers, and reverse numbers
disp(oddNumbers)
disp(evenNumbers)
disp(reverseNumbers)
%------------- END OF CODE --------------
end

