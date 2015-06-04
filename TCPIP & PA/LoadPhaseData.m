%   Author: JI Xiang
%   Date:   10/29/2013
%   Set load bit of DO card high voltage and load channel and phase data
%   into phase signal generator.

function LoadPhaseData(DO)

PortForLoad = 3;
ByteForLoad = 1;
ByteForLock = 0;

strFuncByteOutput = 'ByteOutput';

DO.Port = PortForLoad;

for i=1:10
    DO.invoke(strFuncByteOutput,ByteForLoad);
end

for i=1:3
    DO.invoke(strFuncByteOutput,ByteForLock);
end