%--------------------------------------------------------------------------
%   Possible status for function 'saveImage'.
%--------------------------------------------------------------------------
%   AUTHOR: ZHOU Bofan
%   Last modified by ZHOU Bofan APR-10-2015
%--------------------------------------------------------------------------

function Status = getsaveOneFrameStatus

Status = struct( 'RAW',             int8(0),   ...
                 'OBTAINED',        int8(1),   ...
                 'SAVEFINISHED',    int8(2),   ...
                 'DONE',            int8(100), ...
                 'ERROR',           int8(99)       );