%--------------------------------------------------------------------------
%   Possible status for function 'startVideo'.
%--------------------------------------------------------------------------
%   AUTHOR: ZHOU Bofan
%   Last modified by ZHOU Bofan APR-10-2015

function Status = getstartVideoStatus

Status = struct( 'RAW',     int8(0),  ...
                 'CHECKED', int8(1),  ...
                 'STARTED', int8(2),  ...
                 'DONE',    int8(100)     );