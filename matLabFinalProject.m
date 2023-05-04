distance3D = @(x2,y2,z2) sqrt(((0-x2)^2)+((50-y2)^2)+((4.5-z2)^2));
dB = @(d) 10*(log10((d^2)^(-1)))+100;
seats = zeros(50,34);
% Values In Feet vv
seatSize = 23/12; 
rowSpacing = 42/12; 
stageRise = 4.5; 
stageUp = 29.27; 
aisleSize = 4;
stageUpPerSeat = 29.27/30; 
heights = 4+rand(1260,1);
rowInFeet = 14*2;
colInFeet = 30*5.4;
% Values in Feet ^^
seats(3:14,5:34) = true;
seats(17:30,5:34) = true;
seats(33:48,5:34) = true;
decib = zeros(50,34);
for i = 1:50
    for j = 1:34
        if seats(i,j)
            randHeight = 1;
            distance = distance3D(((i*2)-0.5),((j*2)+5.4),((j-4)+(heights(randHeight))));
            decib(i,j) = dB(distance);
            randHeight = randHeight +1;
        end
    end
end