% FUNCTION_NAME - Calculate powerloss using set parameters and materials
% Assignment: A2_Problem_1
%
% Inputs: Diameter, Current, Length, Resistivity, Material
% Outputs: Powerloss (watt)
%
% Author: Gabe DiMartino
% Date: 02/5/2023; Last revision: 5-February-2023
%------------- BEGIN CODE --------------
clc

% Define a matrix to store the material names and their corresponding resistivity values
materialName = ["Silver";"Copper";"Gold";"Aluminum";"Iron"];
materialInt = [1.59e-8;1.68e-8;2.44e-8;2.81e-8;1.0e-7];

% Define the length of the wire
length = 3.5;

% Define the diameter of the wire
diameter = 0.007;

% Define the current flowing through the wire
current = 118;

% Calculate the power loss for each material using the formula
powerLoss = (current^2).*((materialInt.*length)./(((diameter/2)^2)*pi));


% Extract the power loss of copper material
copperPower = powerLoss(2,1);

% Display the full materialPowerLoss matrix
table(materialName, powerLoss)

% Display the power loss of copper material
fprintf('The power lost by a %2.2e meter length of %2.3e meter diameter wire made of Copper is %0.2e watts. \n',length,diameter,copperPower)

clear
%------------- END OF CODE --------------