% FUNCTION_NAME - Calculate angles and side lengths
% Assignment: A1_Problem_2
%
% Inputs: angle - angle size.
%         side - side length.
% Outputs: angle - angle size.
%         side - side length.
%
% Author: Gabe DiMartino
% Date: 01/31/2023; Last revision: 31-January-2023
%------------- BEGIN CODE --------------
angleA = input("Angle A: ");
angleC = input("Angle C: ");
sideB = input("Distance of side B: ");

angleB = 180 - angleA - angleC;
sideA = (sideB/sind(angleB))*sind(angleA);
sideC = (sideB/sind(angleB))*sind(angleC);

fprintf('Angle A: %3.0f degrees \n', angleA)
fprintf('Angle B: %3.0f degrees \n', angleB)
fprintf('Angle C: %3.0f degrees \n', angleC)
fprintf('Distance a: %0.0f meters \n', sideA)
fprintf('Distance b: %0.0f meters \n', sideB)
fprintf('Distance c: %0.0f meters \n', sideC)

%------------- END OF CODE --------------