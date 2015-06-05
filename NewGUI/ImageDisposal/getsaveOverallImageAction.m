%--------------------------------------------------------------------------
%   Possible actions for function 'saveOverallImage'.
%--------------------------------------------------------------------------
%   AUTHOR: ZHOU Bofan
%   Last modified by ZHOU Bofan APR-21-2015
%--------------------------------------------------------------------------

function Action = getsaveOverallImageAction

Action = struct ('CHECKVID',        int8(1),    ...
                 'CHECKPROBE',      int8(2),    ...
                 'SAVE',            int8(3),    ...
                 'DONE',            int8(100)       );