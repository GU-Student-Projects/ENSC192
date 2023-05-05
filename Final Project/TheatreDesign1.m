% ENSC192 - Spring 2023
%
% 2D Model of an indoor theatre space
%
% Author: Noah Sabra, Alex McCulloch, Payton Peters, Gabe DiMartino
% Date: 05/4/2023; Last revision: 04-May-2023
%------------- BEGIN CODE --------------
close all;
clear;
clc;
% Define 3D distance function
distance3D = @(x2,y2,z2) sqrt(((50-x2)^2)+((0-y2)^2)+((4.5-z2)^2));

% Define decibel function
dB = @(d) 10*(log10((d^2)^(-1)))+100;

% Initialize seating and counters
seats = zeros(50,38);
tier3 = 0;
tier2 = 0;
tier1 = 0;
firstRow = 0;

% Unit conversion and constants
seatSize = 23/12; 
rowSpacing = 42/12; 
stageRise = 4.5; 
stageUp = 29.27; 
aisleSize = 4;
stageUpPerSeat = 29.27/30;

% Generate random heights for audience members
heights = 4+rand(1260,1);

% Set up seating arrangement
seats(3:16,4:33) = true;
seats(19:32,4:33) = true;
seats(35:48,4:33) = true;

% Initialize decibel matrix
decib = zeros(50,38);

% Calculate decibel levels for each seat
for i = 1:50
    for j = 1:38
        if seats(i,j)
            randHeight = 1;
            x1 = (i * 2) - 0.5;
            y1 = (j * 2) + 6;
            z1 = ((j - 4) * stageUpPerSeat) + (heights(randHeight));

            distance = distance3D(x1, y1, z1);

            decib(i,j) = dB(distance);

            randHeight = randHeight +1;

             % Count seat tiers
            if (y1 > 100)
                tier3 = tier3 + 1;
            elseif (y1 > 40)
                tier2 = tier2 + 1;
            elseif (j > 3)
                tier1 = tier1 + 1;
            else
                firstRow = firstRow + 1;
            end
        else
            decib(i, j) = 55;
        end
    end
end

% Plot heatmap of decibel levels
heatmap(decib)

% Calculate money gained
moneyGained = ((tier3 * 20) + (tier2 * 45) + (tier1 * 80) + (firstRow * 100))*(0.94*0.88);
yearlyReavenue = (moneyGained*90) - (moneyGained * 90)*0.8;
fprintf("The money gained from this theatre per showing is $%0.0f. \n", moneyGained);
fprintf("The money earned per year is $%0.0f. \n", yearlyReavenue);
%------------- END OF CODE --------------