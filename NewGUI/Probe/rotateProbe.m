%--------------------------------------------------------------------------
%   Rotate the probe to the next position if the value of position is
%   valid. And return true if the position is arrived, or else return false.
%--------------------------------------------------------------------------
%   AUTHOR: JI Xiang
%   Last modified by JI Xiang APR-05-2015
%--------------------------------------------------------------------------

function Success = rotateProbe(Probe,NextPos)

Success = false;
Directive = getProbeDirective;

if strcmp(Probe.PrevPos,NextPos)
    Success = true;
else
    StepCount = CountRotatingStep(Probe.PrevPos,NextPos) + 1;
    if ~isempty(StepCount)
        fwrite(Probe.Serial,position2directive(NextPos),'uint8');
        BytesRead = fread(Probe.Serial,StepCount,'uint8');
        IsLengthValid = (length(BytesRead == (StepCount)));
        IsReadBytesValid = ((BytesRead(StepCount - 1) ==...
            position2directive(NextPos)) &&...
            (BytesRead(StepCount) == Directive.ARRIVE));
        if IsLengthValid && IsReadBytesValid
            Success = true;
            cleanBuffer(Probe.Serial);
        end
    end
end