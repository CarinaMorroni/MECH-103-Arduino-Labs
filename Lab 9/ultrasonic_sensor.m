clear

%set up arduino
sensyArduino = arduino('COM3','Uno','libraries','ultrasonic');

% ultrasonic sensor pins
trig_pin = 'D11';
echo_pin = 'D10';

% speaker 
speak_pin = 'D5'
duty_cycle = 0.97;

% set up ultrasonic sensor
ultraSensor = ultrasonic(sensyArduino, trig_pin, echo_pin);


D_1 = 0.765
D_2 = 1.022
D_3 = 1.276
D_4 = 2.009

E_1 = ((D_1-0.75)/0.75)*100
E_2 = ((D_2-1)/1)*100
E_3 = ((D_3-1.25)/1.25)*100
E_4 = ((D_4-2)/2)*100

while(1)
    
    distance = readDistance(ultraSensor) % don't use ; so distance shows up in command window
    
    if distance > 2
        writeDigitalPin(sensyArduino,'D4',0);
        writeDigitalPin(sensyArduino,'D3',0);
        writeDigitalPin(sensyArduino,'D2',1);
        writeDigitalPin(sensyArduino,'D7',1);
        writeDigitalPin(sensyArduino,'D6',1);
    elseif distance > 1
        if distance > 1.25
            writeDigitalPin(sensyArduino,'D4',1);
            writeDigitalPin(sensyArduino,'D3',0);
            writeDigitalPin(sensyArduino,'D2',1);
            writeDigitalPin(sensyArduino,'D7',1);
            writeDigitalPin(sensyArduino,'D6',1);
        else
            writeDigitalPin(sensyArduino,'D4',1);
            writeDigitalPin(sensyArduino,'D3',0);
            writeDigitalPin(sensyArduino,'D2',0);
            writeDigitalPin(sensyArduino,'D7',1);
            writeDigitalPin(sensyArduino,'D6',1);
        end
       elseif distance > 0.75
            writeDigitalPin(sensyArduino,'D4',1);
            writeDigitalPin(sensyArduino,'D3',1);
            writeDigitalPin(sensyArduino,'D2',0);
            writeDigitalPin(sensyArduino,'D7',0);
            writeDigitalPin(sensyArduino,'D6',1);
            
    elseif distance > 0
        writeDigitalPin(sensyArduino,'D4',1);
        writeDigitalPin(sensyArduino,'D3',1);
        writeDigitalPin(sensyArduino,'D2',1);
        writeDigitalPin(sensyArduino,'D7',0);
        writeDigitalPin(sensyArduino,'D6',0);
       
    end
    
    pause(0.25)
end


% play sound
% writePWMDutyCycle(sensyArduino,speak_pin,duty_cycle);

