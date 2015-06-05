%--------------------------------------------------------------------------
%   Possible actions for function 'saveImage'.
%--------------------------------------------------------------------------
%   AUTHOR: ZHOU Bofan
%   Last modified by ZHOU Bofan APR-10-2015
%--------------------------------------------------------------------------

function Action = getsaveOneFrameAction

Action = struct( 'CHECK',           int8(1), ...
                 'SAVE',            int8(2), ...
                 'CHECKEXISTENCE',  int8(3), ...
                 'DONE',            int8(100)    );