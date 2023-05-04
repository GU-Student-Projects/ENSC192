% FUNCTION_NAME - Calculate feet to meters
% Assignment: A1_Problem_1
%
% Inputs: feet - distance in feet.
% Outputs: meters - distance in meters.
%
% Author: Gabe DiMartino
% Date: 01/31/2023; Last revision: 31-January-2023
%------------- BEGIN CODE --------------

feet = input("What was the initial distance? ");
meters = ft_to_m(feet);

distanceRemaining = (1000 * 100) - meters;
initialVelocity = sqrt(2 * distanceRemaining * 9.81);

fprintf('The initial velocity to reach outerspace would be %0.3f m/s \n', initialVelocity)

%------------- END OF CODE --------------