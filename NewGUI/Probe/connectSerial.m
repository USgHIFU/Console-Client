%--------------------------------------------------------------------------
%   Find the active connected hardware within the available serial ports
%   and return the ports.
%--------------------------------------------------------------------------
%   AUTHOR: JI Xiang
%   Last modified by JI Xiang MAR-28-2015
%--------------------------------------------------------------------------

function ConnectedPort = connectSerial(Port)

ConnectedPort = [];
Directive = getSerialDirective;

for iPort = 1:size(Port,1)
    Serial = newSerial(Port(iPort,:));
    fwrite(Serial,Directive.CONNECT,'uint8');
    BytesRead = fread(Serial,1,'uint8');
    IsLengthValid = (length(BytesRead) == 1);
    IsReadByteValid = (BytesRead == Directive.ANSWER);
    if IsLengthValid && IsReadByteValid
        ConnectedPort = [ConnectedPort;Serial.Port];
    end
    deleteSerial(Serial);
end