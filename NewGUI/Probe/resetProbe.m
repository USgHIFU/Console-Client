%--------------------------------------------------------------------------
%   Check whether the probe could normally rotate.
%   If the probe is successfully reset, return true, else return false.
%--------------------------------------------------------------------------
%   AUTHOR: JI Xiang
%   Last modified by JI Xiang APR-06-2015
%--------------------------------------------------------------------------

function Success = resetProbe(Probe)

Success = false;
Directive = getProbeDirective;

fwrite(Probe.Serial,Directive.CHECK,'uint8');
BytesRead = fread(Probe.Serial,3,'uint8');
IsLengthValid = (length(BytesRead) == 3);
IsReadBytesValid = ((BytesRead(1) == Directive.ANGLE90) &&...
                    (BytesRead(2) == Directive.ANGLE90) &&...
                    (BytesRead(3) == Directive.ARRIVE));
if  IsLengthValid && IsReadBytesValid
    Success = true;
    cleanBuffer(Probe.Serial);
end