clear;

musicalArduino = arduino();

% pins connected to buttons
greenButton_pin = 'D8';
redButton_pin = 'D9';
yellowButton_pin = 'D10';

% pins connected to lights
greenLight_pin = 'D5';
redLight_pin = 'D6';
yellowLight_pin = 'D7';

%pin connected to speaker
speak_pin = 'D3';
duty_cycle = 0.5;

%play sound with speaker
%writePWMDutyCycle(musicalArduino,speak_pin,duty_cycle);


while(1)
    %reading voltage from the pin, 0/1 tells us if there is voltage or not
    greenButton_state = readDigitalPin(musicalArduino,greenButton_pin);
    redButton_state = readDigitalPin(musicalArduino,redButton_pin);
    yellowButton_state = readDigitalPin(musicalArduino,yellowButton_pin);
    
    writeDigitalPin(musicalArduino, greenLight_pin, 0);
    writeDigitalPin(musicalArduino, redLight_pin, 0);
    writeDigitalPin(musicalArduino, yellowLight_pin, 0);
    
    if greenButton_state == 1 
        playTone(musicalArduino, speak_pin, 440, 0.1);
        for interval = 1:4
            writeDigitalPin(musicalArduino, greenLight_pin, 1);
            pause(0.125);
            writeDigitalPin(musicalArduino, greenLight_pin, 0);
            pause(0.125);
        end
        while greenButton_state == 1
            playTone(musicalArduino, speak_pin, 440, 0.1);
            writeDigitalPin(musicalArduino, greenLight_pin, 1);
            greenButton_state = readDigitalPin(musicalArduino,greenButton_pin);
        end
    end
    if redButton_state == 1
        playTone(musicalArduino, speak_pin, 250, 0.1);
        for interval = 1:4
            writeDigitalPin(musicalArduino, redLight_pin, 1);
            pause(0.125);
            writeDigitalPin(musicalArduino, redLight_pin, 0);
            pause(0.125);
        end
        while redButton_state == 1
            playTone(musicalArduino, speak_pin, 250, 0.1);
            writeDigitalPin(musicalArduino, redLight_pin, 1);
            redButton_state = readDigitalPin(musicalArduino,redButton_pin);
        end
    end
    if yellowButton_state == 1
        playTone(musicalArduino, speak_pin, 300, 0.1);
        for interval = 1:4
            writeDigitalPin(musicalArduino, yellowLight_pin, 1);
            pause(0.125);
            writeDigitalPin(musicalArduino, yellowLight_pin, 0);
            pause(0.125);
        end
        while yellowButton_state == 1
            playTone(musicalArduino, speak_pin, 300, 0.1);
            writeDigitalPin(musicalArduino, yellowLight_pin, 1);
            yellowButton_state = readDigitalPin(musicalArduino,yellowButton_pin);
        end
    end
    end

   

