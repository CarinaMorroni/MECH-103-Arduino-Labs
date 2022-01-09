% hrs_pre = measured amount of time (in hours) that the lights are on without people
% in the room
% watts_pre = amount of power (in watts) that the current lightbulbs use

hrs_pre = 23.13
watts_pre = 60

% hrs_post = hypothesized amount of time (in hours) that the lights are on without
% people in the room, with a motion sensor
% watts_post = amount of power (in watts) that the suggested lightbulbs
% would use

hrs_post = 6.35
watts_post = 8.5

% num_fixtures = number of light fistures in the room

num_fixtures = 8

% just creating the variables to use in the for loop
kWh_best_savings = 0;
kWh_sensor_savings = 0;
kWh_lightbulb_savings = 0;


% When motion-sensor is 1, that means we solve the equation as if we had a
% motion sensor (using the hrs_post variable), if it is 0, we act as if there is not motion sensor. 
% If new_lightbulb is 1, we have new light bulbs in that
% equation, if it is 0, we do not.

motion_sensor = 1;
new_lightbulb = 0;

% basically this loop assigns motion_sensor and new_lightbulb 1's and 0's
% to form every possible combination (1,0  0,1  1,1)
for j = 1:3
    
    % kWh_savings with both a motion sensor and new lightbulbs
    if motion_sensor == 1 && new_lightbulb == 1
        kWh_best_savings = num_fixtures*(1/1000)*((watts_pre * hrs_pre)- (watts_post * hrs_post))  
    end
    % kWh_savings with no motion sensor but new lightbulbs
    if motion_sensor == 0 && new_lightbulb == 1
        kWh_lightbulb_savings = num_fixtures*(1/1000)*((watts_pre * hrs_pre)- (watts_post * hrs_pre))
    end
    % kWh_savings with a motion sensor but no new lightbulbs
    if motion_sensor == 1 && new_lightbulb == 0
        kWh_sensor_savings = num_fixtures*(1/1000)*((watts_pre * hrs_pre)- (watts_pre * hrs_post))
    end
    
    
    if new_lightbulb == 1
        motion_sensor = ~ motion_sensor
        new_lightbulb = new_lightbulb
        
    else
        motion_sensor = ~ motion_sensor
        new_lightbulb = ~ new_lightbulb
    end
end

disp(kWh_best_savings)
disp(kWh_sensor_savings)
disp(kWh_lightbulb_savings)

best_money_savings = kWh_best_savings * 11.5 
sensor_money_savings = kWh_sensor_savings * 11.5
lightbulb_money_savings = kWh_lightbulb_savings * 11.5

M = categorical({'With Motion Detector', 'With LED Lightbulbs', 'With Both'});
M = reordercats(M,{'With Motion Detector', 'With LED Lightbulbs', 'With Both'});
N = [kWh_sensor_savings, kWh_lightbulb_savings, kWh_best_savings];

bar(M,N,'b')
ylabel('Energy Saved (kWh)');
grid on

%X = categorical({'With Motion Detector', 'With LED Lightbulbs', 'With Both'});
%X = reordercats(X,{'With Motion Detector', 'With LED Lightbulbs', 'With Both'});
%Y = [sensor_money_savings, lightbulb_money_savings, best_money_savings];

%bar(X,Y,'c')
%ylabel('Money Saved (cents)');
%grid on
