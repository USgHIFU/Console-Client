%   Author: JI Xiang
%   Date:   10/29/2013
%   Set enable bit of DO card low voltage and stop exciting the phased
%   array.

function DisableDigitalOutput(DO)

PortForDisable = 3;
ByteForDisable = 0;
strFuncByteOutput = 'ByteOutput';

DO.Port = PortForDisable;
DO.invoke(strFuncByteOutput,ByteForDisable);