%--------------------------------------------------------------------------
%   Possible actions for function 'startVideo'.
%--------------------------------------------------------------------------
%   AUTHOR: ZHOU Bofan
%   Last modified by ZHOU Bofan APR-10-2015
%--------------------------------------------------------------------------

function Action = getstartVideoAction

Action = struct( 'CHECK',   int8(1), ...
                 'START',   int8(2), ...
                 'FILMING', int8(3)      );