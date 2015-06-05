%--------------------------------------------------------------------------
%   Possible actions for function 'stopVideo'.
%--------------------------------------------------------------------------
%   AUTHOR: ZHOU Bofan
%   Last modified by ZHOU Bofan APR-10-2015
%--------------------------------------------------------------------------

function Action = getstopVideoAction

Action = struct( 'CHECK',           int8(1),  ...
                 'STOP',            int8(2),  ...
                 'CHECKEXISTENCE',  int8(3),  ...
                 'DONE',            int8(100)     );