%   1. Scan the ports and find the available ports;
%   2. Identify which connected port is probe;
%   3. Create the probe object and return the object, or else return empty.
%--------------------------------------------------------------------------
%   AUTHOR: JI Xiang
%   Last modified by JI Xiang MAR-28-2015.
%--------------------------------------------------------------------------

function Probe = newProbe

AvailablePort = scanSerial;
ConnectedPort = connectSerial(AvailablePort);
[Port4Probe,Port4Cycle] = identifySerial(ConnectedPort);

Status = getProbeStatus;

if ~isempty(Port4Probe)
    Probe.Serial = newSerial(Port4Probe);
    Probe.Status = Status.INITIALIZED;
    Probe.Action = [];
    Probe.PrevPos = [];
    Probe.NextPos = [];
else
    Probe = [];
end