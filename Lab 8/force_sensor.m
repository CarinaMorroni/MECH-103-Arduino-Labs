clear;

FSR_PIN = 'A0';

VCC = 5;
R_DIV = 9800;
W_0 = 42;
density = 0.99669/1000;
acceleration = 9.81;

forceArduino = arduino();
waitTime = 2;

V_1 = ((((250).*0.00980665)./acceleration)/density)/29.57
V_2 = ((((500).*0.00980665)./acceleration)/density)/29.57
V_3 = ((((1000).*0.00980665)./acceleration)/density)/29.57
V_4 = ((((2000).*0.00980665)./acceleration)/density)/29.57

while(1)
    fsrVoltage = readVoltage(forceArduino, FSR_PIN)
    
    if fsrVoltage > 0
        fsrResistance = ((R_DIV*VCC)-(fsrVoltage*R_DIV))/fsrVoltage;
        fprintf("Resistance is %f\n",fsrResistance);
        
        
        fsrConductance = 1/fsrResistance;
        
        if fsrResistance <= 600
            force = (fsrConductance - 7.5E-4)/3.2639E-7;
            disp('less than 600')
        else
            force = fsrConductance/6.42857E-7;
            
            fprintf("\tThe force is %f\n",force);
            writeDigitalPin(forceArduino, 'D7', 1); %LED on
            writeDigitalPin(forceArduino, 'D6', 0); %LED off
            writeDigitalPin(forceArduino, 'D5', 0); %LED off
            writeDigitalPin(forceArduino, 'D4', 0); %LED off
            writeDigitalPin(forceArduino, 'D3', 0); %LED off
            
            if force > 2000+W_0
                writeDigitalPin(forceArduino, 'D7', 1); %LED on
                writeDigitalPin(forceArduino, 'D6', 1); %LED on
                writeDigitalPin(forceArduino, 'D5', 1); %LED on
                writeDigitalPin(forceArduino, 'D4', 1); %LED on
                writeDigitalPin(forceArduino, 'D3', 1); %LED on
                
                experimental_4 = 104.7
               
            else if force > 1000+W_0
                    writeDigitalPin(forceArduino, 'D7', 1); %LED on
                    writeDigitalPin(forceArduino, 'D6', 1); %LED on
                    writeDigitalPin(forceArduino, 'D5', 1); %LED on
                    writeDigitalPin(forceArduino, 'D4', 1); %LED on
                    writeDigitalPin(forceArduino, 'D3', 0); %LED off
                    
                    experimental_3 = 63.4
                    
                else if force > 500+W_0
                        writeDigitalPin(forceArduino, 'D7', 1); %LED on
                        writeDigitalPin(forceArduino, 'D6', 1); %LED on
                        writeDigitalPin(forceArduino, 'D5', 1); %LED on
                        writeDigitalPin(forceArduino, 'D4', 0); %LED off
                        writeDigitalPin(forceArduino, 'D3', 0); %LED off
                        
                        experimental_2 = 31.2
                       
                    else if force > 250+W_0
                            writeDigitalPin(forceArduino, 'D7', 1); %LED on
                            writeDigitalPin(forceArduino, 'D6', 1); %LED on
                            writeDigitalPin(forceArduino, 'D5', 0); %LED off
                            writeDigitalPin(forceArduino, 'D4', 0); %LED off
                            writeDigitalPin(forceArduino, 'D3', 0); %LED off
                            
                            experimental_1 = 14.9
                            
                        end
                    end
                end
            end
       
           pause(waitTime);
        end
    else
        writeDigitalPin(forceArduino, 'D7', 0); %LED off
        writeDigitalPin(forceArduino, 'D6', 0); %LED off
        writeDigitalPin(forceArduino, 'D5', 0); %LED off
        writeDigitalPin(forceArduino, 'D4', 0); %LED off
        writeDigitalPin(forceArduino, 'D3', 0); %LED off
        
        fprintf("No resistance detected\n");
        pause(waitTime);
    end 
end

%theoretical volume
V_1 = ((((250).*0.00980665)./acceleration)/density)/29.57
V_2 = ((((500).*0.00980665)./acceleration)/density)/29.57
V_3 = ((((1000).*0.00980665)./acceleration)/density)/29.57
V_4 = ((((2000).*0.00980665)./acceleration)/density)/29.57

%experimental error
error_4 = (experimental_4-V_4)/V_4 * 100
error_3 = (experimental_3-V_3)/V_3 * 100
error_2 = (experimental_2-V_2)/V_2 * 100
error_4 = (experimental_1-V_1)/V_1 * 100
       
% f*0.00980665 = ma
% m = f/9.8
% density = m/v
% v = m/d
% v = (f/9.8)/d

