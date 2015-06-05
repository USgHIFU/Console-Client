%--------------------------------------------------------------------------
%   Clean the input buffer and output buffer before any action.
%--------------------------------------------------------------------------
%   AUTHOR: JI Xiang
%   Last modified by JI Xiang APR-10-2015
%--------------------------------------------------------------------------

function cleanBuffer(Serial)

flushinput(Serial);
flushoutput(Serial);