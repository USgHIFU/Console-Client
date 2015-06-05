%--------------------------------------------------------------------------
%   Possible actions for function 'createFocus'.
%--------------------------------------------------------------------------
%   AUTHOR: ZHOU Bofan
%   Last modified by ZHOU Bofan APR-14-2015
%--------------------------------------------------------------------------

function Action = getcreateFocusAction

Action = struct ( 'CHECK',      int8(1),    ...
                  'INITGRID',   int8(2),    ... 
                  'DONE',       int8(100),      )