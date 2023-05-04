%------------- BEGIN CODE --------------
    clc; close all; clear; clear maize;

    
%====START Test====
maize = arduino('Com6', 'Uno', 'Libraries', {'Ultrasonic', 'Servo', 'I2C'});
if ~isvalid(maize)
    error('Failed to create Arduino object')
end

ledPin = 'D12'; configurePin(maize,ledPin,'DigitalOutput');
buttonPin = 'D13'; configurePin(maize,buttonPin,'DigitalInput')
tonePin = 'D11'; configurePin(maize, tonePin, 'Tone');
usEchoPin = 'A1'; configurePin(maize,usEchoPin,'Ultrasonic');
usTriggerPin = 'A0'; configurePin(maize,usTriggerPin,'Ultrasonic'); % Ultrasonic trigger 
tempPin = 'A3'; configurePin(maize,tempPin,'AnalogInput');
ldrPin = 'A4';configurePin(maize,ldrPin,'AnalogInput');
potPin = 'A5'; configurePin(maize,potPin,'AnalogInput');
ssrPin = 'A2'; configurePin(maize,ssrPin,'DigitalOutput');
frontServoPin = 'D10'; configurePin(maize,frontServoPin,'Servo');

enA = 'D5'; in1 = 'D4'; in2 = 'D2'; % Motor A (LEFT) pins
enB = 'D6'; in3 = 'D8'; in4 = 'D7'; % Motor B (RIGHT) pins

writePWMDutyCycle(maize,enA, 1);
writePWMDutyCycle(maize, enB, 1);
configurePin(maize,enA,'PWM');
configurePin(maize,in1,'DigitalOutput'); configurePin(maize,in2,'DigitalOutput');
configurePin(maize,enB,'PWM');
configurePin(maize,in4,'DigitalOutput'); configurePin(maize,in3,'DigitalOutput');


%The Power
fprintf('the battery is giving %0.2 volts.',readVoltage(maize,potPin)*3);
% Button wait
    fprintf('\nI''ll wait for you to press the button\n')
    buttonWait(maize,buttonPin,ledPin,0.1);
    fprintf('ButtonWait done\n');
% random led function call
    randomLED(maize,ssrPin,ldrPin);
% Button Test
    buttonLevel = readDigitalPin(maize, buttonPin);
     fprintf('\t2 - Button condition is %0.0f, 0 => OFF\t1 => ON\n',buttonLevel);
% Battery Voltage Test
     actualBattVolts = 11.00; initialVoltsReading = 3.38;
     calScale = actualBattVolts / initialVoltsReading;
     potVoltage = readVoltage(maize,potPin);
     batteryLevel = potVoltage * calScale;
     fprintf('\t3 - Battery Voltage = %0.2fV from a Sensor Voltage of %0.2fV\n',batteryLevel,potVoltage);



% Buzzer Test
     playTone(maize, tonePin, 329.63, 0.5);
     pause(1);
     playTone(maize, tonePin, 392.00, 0.5);
     pause(0.5);
     playTone(maize, tonePin, 440.00, 0.5);
     pause(0.5);
     playTone(maize, tonePin, 493.88, 0.5);
     pause(0.5);
     playTone(maize, tonePin, 523.25, 0.5);
     pause(0.5);
     playTone(maize, tonePin, 587.33, 0.5);
     pause(0.5);
     playTone(maize, tonePin, 659.25, 0.5);
     pause(1);
     playTone(maize, tonePin, 587.33, 0.5);
     pause(0.5);
     playTone(maize, tonePin, 493.88, 0.5);
     pause(0.5);
     playTone(maize, tonePin, 440.00, 0.5);
     pause(0.5);
     playTone(maize, tonePin, 392.00, 0.5);
     pause(1);
     playTone(maize, tonePin, 329.63, 0.5);
     pause(1); % need pause to wait for tone to play before "clear" command below
     fprintf('\t5 - Done Buzzer Control\n');
% Light Dependent Resistor Test
     ldrVoltage = readVoltage(maize,ldrPin);
     fprintf('\t6 - LDR voltage = %0.3fV\n',ldrVoltage);
% Thermistor Test
     tempVoltage = readVoltage(maize,tempPin);
     fprintf('\t7 - Themistor voltage = %0.3fV\n',tempVoltage);
% Solid State Relay Control
    writeDigitalPin(maize, ssrPin, 1); % ON
    pause(2);
     writeDigitalPin(maize, ssrPin, 0); % OFF
     fprintf('\t8 - Done SSR Control\n');
% Ultrasonic Range Test
     frontUSsensor = ultrasonic(maize,usTriggerPin,usEchoPin,'OutputFormat','double' );
     distance = readDistance(frontUSsensor);
     fprintf('\t4 - Current distance is %0.1f cm.\n',distance*100);

% returned range for object scan
% servo target array setup
%servoAngle = [-90 -45 0 45 90]';
%servoPosition = [1 0.75 0.5 0.25 0]';
%writePosition(servoAngle,servoPosition(1));
%writePos = readPosition(servoAngle);
%writeDist = readDistance(servoAngle);
%writeEchoTime = readEchoTime(servoAngle);

%countVal = 2;
%while countVal <= length(servoPosition)
%writePosition (frontUSsensor, servoPosition(countVal));
%writePos = cat(1,writePos,readPosition(frontUSsensor));
%writeDist = cat(1,writeDist,readDistance(frontUSsensor));
%writeEchoTime = cat(1,writeEchoTime,readEchoTime(frontUSsensor));
%countVal = countVal+1;
%end

%usRangeData = table(servoAngle,servoPosition,writePos,writeDist,writeEchoTime, ...
%    'VariableNames',{'Angle','Servo Position','Actual Position','Range (m)','Echo Time (s)'});
%plot(servoAngle,writeDist,'Marker','x','LineStyle','none','Color','r')
%title("Figure 1: Returned range for object scan")
%xlabel("Angle - degrees")
%ylabel("Range - m")

     

% Test motors

ForwardMotion(maize,2,1,in1,in2,in3,in4,enA,enB);

BackwardsMotion(maize,2,1,in1,in2,in3,in4,enA,enB);

LeftMotion(maize,2,0.5,in1,in2,in3,in4,enA,enB);

RightMotion(maize,2,0.5,in1,in2,in3,in4,enA,enB);
clear maize
     %=== Local Functions ====

function buttonWait(name,buttonPin,ledPin,delay)
fprintf('\nPress button when ready\n');
buttonState = 0;
while buttonState == 0
     buttonState = readDigitalPin(name, buttonPin);
     writeDigitalPin(name, ledPin, 1); % ON
     pause(delay);
     writeDigitalPin(name, ledPin, 0); % OFF
end
fprintf('ButtonWait over\n');
end

function randomLED(name,ssrPin,ldrPin)
ledRandom = (randi(2)-1); % random led on or off
writeDigitalPin(name, ssrPin, ledRandom); % turning led on
pause(0.25); % 1/4 second pause before reading
lightRead = readVoltage(name,ldrPin); %light reading from the ldr
threshold = 2.8;
fprintf('Problem1:\nSSr condition was %0.0f, 1 = ON, 0 = OFF\n',ledRandom);
fprintf(['LDR voltage repoted was %0.3f volts, LED ON' ...
    ' < %0.3f < LED OFF.\n'],lightRead,threshold);
end


function ForwardMotion(name,speedMotors,duration,in1,in2,in3,in4,enA,enB)
    fprintf('Starting forwards movement.\n');
    
 % Assign Left and Right Rotation Direction
     writeDigitalPin(name,in1,0); writeDigitalPin(name,in2,1); % A
     writeDigitalPin(name,in4,0); writeDigitalPin(name,in3,1); % B
 % Assign Speed to both motors
     writePWMVoltage(name,enA,speedMotors); % Left
     writePWMVoltage(name,enB,speedMotors); % Right
     pause(duration);
 % Assign Speed = 0 to both motors
     writePWMVoltage(name,enA,1); writePWMVoltage(name,enB,1); % speed zero
     fprintf('\t10.1 - Move Forward Complete\n');
end

function BackwardsMotion(name,speedMotors,duration,in1,in2,in3,in4,enA,enB)
    fprintf('Starting backwards movement.\n');
 % Assign Left and Right Rotation Direction
     writeDigitalPin(name,in1,1); writeDigitalPin(name,in2,0); % A
     writeDigitalPin(name,in4,1); writeDigitalPin(name,in3,0); % B
 % Assign Speed to both motors
     writePWMVoltage(name,enA,speedMotors); % Left
     writePWMVoltage(name,enB,speedMotors); % Right
     pause(duration);
 % Assign Speed = 0 to both motors
     writePWMVoltage(name,enA,0); writePWMVoltage(name,enB,0); % speed zero
     fprintf('\t10.2 - Move Back Complete\n');
end

function LeftMotion(name,speedMotors,duration,in1,in2,in3,in4,enA,enB)
    fprintf('Starting left movement.\n');
 % Assign Left and Right Rotation Direction
     writeDigitalPin(name,in1,0); writeDigitalPin(name,in2,1); % A
     writeDigitalPin(name,in4,1); writeDigitalPin(name,in3,0); % B
 % Assign Speed to both motors
     writePWMVoltage(name,enA,speedMotors); % Left
     writePWMVoltage(name,enB,speedMotors); % Right
     pause(duration);
 % Assign Speed = 0 to both motors
     writePWMVoltage(name,enA,0); writePWMVoltage(name,enB,0); % speed zero
     fprintf('\t10.2 - Move Left Complete\n');
end

function RightMotion(name,speedMotors,duration,in1,in2,in3,in4,enA,enB)
    fprintf('Starting right movement.\n');
 % Assign Left and Right Rotation Direction
     writeDigitalPin(name,in1,1); writeDigitalPin(name,in2,0); % A
     writeDigitalPin(name,in4,0); writeDigitalPin(name,in3,1); % B
 % Assign Speed to both motors
     writePWMVoltage(name,enA,speedMotors); % Left
     writePWMVoltage(name,enB,speedMotors); % Right
     pause(duration);
 % Assign Speed = 0 to both motors
     writePWMVoltage(name,enA,0); writePWMVoltage(name,enB,0); % speed zero
     fprintf('\t10.2 - Move Right Complete\n');
end

%------------- END OF CODE --------------