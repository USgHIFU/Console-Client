%--------------------------------------------------------------------------
%   Inspect if the right resolution format data exists and set the right
%   number to the target video device.

%   Subroutine of function 'imageInit'.
%--------------------------------------------------------------------------
%   AUTHOR: ZHOU Bofan
%   Last modified by ZHOU Bofan APR-10-2015
%--------------------------------------------------------------------------

function [ID, Success, Err] = resolutionInsp

Err = 'Resolution setting error';
Success = 0;
ID = 0;

AdaptorInfo = getAdaptorInfo;
vidinfo = imaqhwinfo(AdaptorInfo.NAME);
FormatLength = length(vidinfo.DeviceInfo);
Format = AdaptorInfo.FORMAT;

for i = 1 : FormatLength
    if (strcmp(vidinfo.DeviceInfo(1,i).DefaultFormat, Format))
        Success = 1;
        Err = 'None';
        ID = i;
    end
end