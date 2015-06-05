%--------------------------------------------------------------------------
%   Possible status for function 'saveOverallImage'.
%--------------------------------------------------------------------------
%   AUTHOR: ZHOU Bofan
%   Last modified by ZHOU Bofan APR-21-2015
%--------------------------------------------------------------------------

function Status = getsaveOverallImageStatus

Status = struct('RAW',          int8(0),    ...
                'OBTAINED',     int8(1),    ...
                'CONNECTED',    int8(2),	...
                'ERROR',        int8(99),   ...
                'DONE',         int8(100)      );