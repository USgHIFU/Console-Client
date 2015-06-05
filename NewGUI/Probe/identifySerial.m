%--------------------------------------------------------------------------
%   Identify the active connected hardware as probe and cycle, and return
%   the their ports.
%--------------------------------------------------------------------------
%   AUTHOR: JI Xiang
%   Last modified by JI Xiang MAR-28-2015
%--------------------------------------------------------------------------

function [Port4Probe,Port4Cycle] = identifySerial(Port)

Port4Probe = [];
Port4Cycle = [];
Directive = getSerialDirective;

for iPort = 1:size(Port,1)
    Serial = newSerial(Port(iPort,:));
    fwrite(Serial,Directive.IDENTIFY,'uint8');
    BytesRead = fread(Serial,2,'uint8');
    if length(BytesRead) == 2
        if BytesRead == [Directive.IDENTIFY;Directive.ROTATION]
            if isempty(Port4Probe)
                Port4Probe = Serial.Port;
            end
        elseif BytesRead == [Directive.IDENTIFY;Directive.CYCLE]
            if isempty(Port4Cycle)
                Port4Cycle = Serial.Port;
            end
        end
    end
    deleteSerial(Serial);
end