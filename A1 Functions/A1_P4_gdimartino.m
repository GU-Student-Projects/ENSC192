% FUNCTION_NAME - Calculate volume, surface Area, weight
% Assignment: A1_Problem_4
%
% Inputs: numHoles,diameterHole,widthPart,lengthPart, heightPart,rho
% Outputs: volume,weight,surfAreaM
%
% Author: Gabe DiMartino
% Date: 01/31/2023; Last revision: 31-January-2023
%------------- BEGIN CODE --------------
function [volume,weight,surfAreaM] = A1_P4_gdimartino(numHoles,diameterHole,widthPart,lengthPart, heightPart,rho)

volume = (widthPart * lengthPart * heightPart) - numHoles * (pi * (diameterHole/2)^2*heightPart);
weight = rho*volume;
surfAreaM = 2*(lengthPart * heightPart) + 2*(widthPart * heightPart) + 2*((lengthPart * widthPart) - (numHoles*(pi * (diameterHole/2)^2))) + numHoles*(diameterHole*pi*heightPart);

fprintf('The volume of the metal part: %2.2f cm^3 \n', volume)
fprintf('The surface area of the metal part: %3.0f cm^2 \n', surfAreaM)
fprintf('The weight of the metal part: %3.2f g \n', weight)

end

%------------- END OF CODE --------------
