%   Author: JI Xiang
%   Date:   10/29/2013
%   Set enable bit of DO card high voltage and excite the phased array.

function EnableDigitalOutput(DO)

PortForEnable = 3;
ByteForEnable = 2;
strFuncByteOutput = 'ByteOutput';

DO.Port = PortForEnable;
DO.invoke(strFuncByteOutput,ByteForEnable);