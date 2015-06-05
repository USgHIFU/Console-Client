function TreatmentPlan = newTreatmentPlan

TreatmentPlan = struct('SpotNum',           3,...
                       'SpotPosX',          [1.1;2.2;3.3],...
                       'SpotPosY',          [2.2;3.3;4.4],...
                       'SpotPosZ',          [3.3;4.4;5.5],...
                       'SonicationTime',    12,...
                       'SonicationPeriod',  250,...
                       'DutyCycle',         60,...
                       'CoolingTime',       5,...
                       'Voltage',           5,...
                       'Angle',             2.5);