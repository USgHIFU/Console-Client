%--------------------------------------------------------------------------
%   Possible status of function 'imageInit'.
%--------------------------------------------------------------------------
%   AUTHOR: ZHOU Bofan
%   Last modified by ZHOU Bofan APR-26-2015
%--------------------------------------------------------------------------

function Status = getthumbnailStatus

Status = struct( 'RAW',             int8(0),    ...
                 'EXISTCHECKED',    int8(1),    ...
                 'LOADED',          int8(2),    ...
                 'DONE',            int8(100),  ...
                 'ERROR',           int8(99)        );