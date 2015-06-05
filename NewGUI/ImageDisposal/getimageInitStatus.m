%--------------------------------------------------------------------------
%   Possible status of function 'imageInit'.
%--------------------------------------------------------------------------
%   AUTHOR: ZHOU Bofan
%   Last modified by ZHOU Bofan APR-26-2015
%--------------------------------------------------------------------------

function Status = getimageInitStatus

Status = struct(  'RAW',            int8(0),   ...
                  'CLEARED',        int8(1),   ...
                  'CONNECTED',      int8(2),   ...
                  'RESOLUTIONSET',  int8(3),   ...
                  'DONE',           int8(100), ...
                  'ERROR',          int8(99)       );