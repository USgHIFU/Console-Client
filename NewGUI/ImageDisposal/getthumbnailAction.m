%--------------------------------------------------------------------------
%   Possible actions of function 'imageInit'.
%--------------------------------------------------------------------------
%   AUTHOR: ZHOU Bofan
%   Last modified by ZHOU Bofan APR-26-2015
%--------------------------------------------------------------------------

function Action = getthumbnailAction

Action = struct( 'CHECKEXSITENCE',  int8(1), ...
                 'LOAD',            int8(2), ...
                 'DISPLAY',          int8(3), ...
                 'DONE',            int8(100)    );