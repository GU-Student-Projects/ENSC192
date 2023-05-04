% FUNCTION_NAME - Calculate the maximum efficiency of a pump
% Assignment: A2_Problem_2
%
% Inputs: Headheight
% Outputs: Efficiency
%
% Author: Gabe DiMartino
% Date: 02/5/2023; Last revision: 5-February-2023
%------------- BEGIN CODE --------------
clc

% Define a vector of 20 evenly spaced values between 0.01 and 1 to represent the head height
headHeight = linspace(0.01,1,20);

% Calculate the flow rate based on the head height using a predefined formula
flowRate = (-99.22.*(headHeight.^2))-(90.886.*headHeight) + 257.46;

% Calculate the efficiency based on the head height using a predefined formula
efficiency = (-5.596.*(headHeight.^2))-(0.6347.*headHeight) + 5.1038;

% Find the maximum efficiency value
maxEffic = max(efficiency);

% Combine the head height, flow rate, and efficiency values into a matrix
peakData = [headHeight; flowRate; efficiency];

% Transpose the peakData matrix to display the values as columns in a table
peakData = peakData';

% Display the peakData matrix as a table with the first row being the column names
table(peakData,'VariableNames',{'Head Height | Flow Rate | Efficiency'})

% Display the maximum efficiency value
fprintf('The max efficiency is %0.2f \n', maxEffic)

clear
%------------- END OF CODE --------------
