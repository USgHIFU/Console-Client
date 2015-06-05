%--------------------------------------------------------------------------
%   Inspect if the hardware of image module is well connected to the
%   computer.

%   Subroutine of function 'imageInit'.
%--------------------------------------------------------------------------
%   AUTHOR: ZHOU Bofan
%   Last modified by ZHOU Bofan APR-10-2015
%--------------------------------------------------------------------------

function [Success, Err] = connectInsp

Err = 'Image module connection error';
Success = 0;

hwinfo = imaqhwinfo;
AdaptorInfo = getAdaptorInfo;
AdaptorLength = length(hwinfo.InstalledAdaptors);

for i = 1 : AdaptorLength
    if (strcmp(hwinfo.InstalledAdaptors(1,i),AdaptorInfo.NAME))
        Success = 1;
        Err = 'None';
    end
end
