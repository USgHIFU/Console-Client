%--------------------------------------------------------------------------
%   Query the current position of the probe, and return the value.
%--------------------------------------------------------------------------
%   AUTHOR: JI Xiang
%   Last modified by JI Xiang APR-06-2015
%--------------------------------------------------------------------------

function Pos = queryProbe(Probe)

Pos = [];
Directive = getProbeDirective;
fwrite(Probe.Serial,Directive.QUERY,'uint8');
BytesRead = fread(Probe.Serial,3,'uint8');
IsLengthValid = (length(BytesRead) == 3);
IsReadByteValid = (BytesRead(1) == Directive.QUERY);

if IsLengthValid && IsReadByteValid
    Pos = directive2position(BytesRead(2));
    cleanBuffer(Probe.Serial);
end