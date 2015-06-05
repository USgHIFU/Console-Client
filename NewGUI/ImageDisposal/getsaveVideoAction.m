%--------------------------------------------------------------------------
%   Possible actions for function 'saveVideo'.
%--------------------------------------------------------------------------
%   AUTHOR: ZHOU Bofan
%   Last modified by ZHOU Bofan APR-10-2015
%--------------------------------------------------------------------------

function Action = getsaveVideoAction

Action = struct( 'CHECK',   int8(1), ...
                 'START',   int8(2), ...
                 'STOP',    int8(3), ...
                 'SAVE',    int8(4), ...
                 'DONE',    int8(100)    );
    