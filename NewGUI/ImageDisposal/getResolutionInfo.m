%--------------------------------------------------------------------------
%   Constant variables of the image resolution information.
%--------------------------------------------------------------------------
%   AUTHOR: ZHOU Bofan
%   Last modified by ZHOU Bofan APR-09-2015
%--------------------------------------------------------------------------

function Resolution = getResolutionInfo

Resolution = struct( 'ABS',      1024, ...
                     'ORD',      768,  ...
                     'ABSDIV',   4,    ...
                     'ORDDIV',   12        );