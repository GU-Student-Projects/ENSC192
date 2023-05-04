% FUNCTION_NAME - Calculate tier level using area comparison.
% Assignment: A4_Problem_2
%
% Inputs: length, height
% Outputs:
%
% Author: Gabe DiMartino
% Date: 03/26/2023; Last revision: 26-March-2023
%------------- BEGIN CODE --------------
function flats_gdimartino(length,height)

minHeight = 6.125;
minLength = 11.5;
maxHeight = 12;
maxLength = 15;

if (length < minLength) || (length > maxLength) || (height < minHeight) || (height > maxHeight)
    fprintf('Not an acceptable flat size')
else
    minArea = minHeight*minLength;
    maxArea = maxHeight*maxHeight;
    intervalIncrease = (maxArea - minArea)/4;

    tierOne = minArea + intervalIncrease;
    tierTwo = minArea + 2*intervalIncrease;
    tierThree = minArea + 3*intervalIncrease;

    area = length * height;

    if (area <= tierOne)
        fprintf('You are in tier level (1) with an area of %0.2f in^2.', area)
    elseif (area > tierOne) && (area <= tierTwo)
        fprintf('You are in tier level (2) with an area of %0.2f in^2.', area)
    elseif (area > tierTwo) && (area <= tierThree)
        fprintf('You are in tier level (3) with an area of %0.2f in^2.', area)
    else
        fprintf('You are in tier level (4) with an area of %0.2f in^2.', area)
    end
end
end
%------------- END OF CODE --------------