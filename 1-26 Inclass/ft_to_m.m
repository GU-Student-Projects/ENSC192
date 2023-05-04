function [meters_ft] = ft_to_m(feet)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    cmPerInch = 2.54;
    inchesPerFeet = 12;
    metersPerCm = 1/100;
    meters_ft = feet * cmPerInch * inchesPerFeet * metersPerCm;

end