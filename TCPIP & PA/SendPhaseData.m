%   Author: JI Xiang
%   Date:   10/29/2013
%   Send channel and phase data via DO card.

function SendPhaseData(DO,iChannel,iPhase)

PortForChannel = 2;
PortForPhase = 0;

strFuncByteOutput = 'ByteOutput';

DO.Port = PortForChannel;
DO.invoke(strFuncByteOutput,iChannel);

DO.Port = PortForPhase;
DO.invoke(strFuncByteOutput,iPhase);