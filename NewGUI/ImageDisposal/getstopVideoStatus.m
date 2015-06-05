%--------------------------------------------------------------------------
%   Possible status for function 'stopVideo'.
%--------------------------------------------------------------------------
%   AUTHOR: ZHOU Bofan
%   Last modified by ZHOU Bofan APR-10-2015
%--------------------------------------------------------------------------

function Status = getstopVideoStatus

Status = struct( 'RAW',     int8(0),   ...
                 'CHECKED', int8(1),   ...
                 'STOPPED', int8(2),   ...
                 'DONE',    int8(100), ...
                 'ERROR',   int8(99)       );