%--------------------------------------------------------------------------
%   Possible actions for function 'imageInit'.
%--------------------------------------------------------------------------
%   AUTHOR: ZHOU Bofan
%   Last modified by ZHOU Bofan APR-26-2015
%--------------------------------------------------------------------------

function Action = getimageInitAction

Action = struct( 'CLEAR',           int8(1),   ...
                 'CHECKCONNECT',    int8(2),   ...
                 'CHECKRESOLUTION', int8(3),   ...
                 'BUILD',           int8(4),   ... 
                 'DONE',            int8(100)      );                  