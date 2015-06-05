%--------------------------------------------------------------------------
%   Initialize and create the handle of image object 'Vid'.
%--------------------------------------------------------------------------
%   AUTHOR: ZHOU Bofan
%   Last modified by ZHOU Bofan APR-26-2015
%--------------------------------------------------------------------------

function [Vid, CurStatus, CurAction, Err] = imageInit

% Data initialization.
CurStatus = 99;
CurAction = 0;
Err = 'Unknown';

% Data acquisition.
Status = getimageInitStatus;
Action = getimageInitAction;
AdaptorInfo = getAdaptorInfo;
CurStatus = Status.RAW;

% CLEAR
CurAction = Action.CLEAR;
% Clear Vid if is has been occupied.
Vid = imaqfind;
if ~isempty(Vid)
    delete(Vid);
end
CurStatus = Status.CLEARED;

% CHECKCONNECT
CurAction = Action.CHECKCONNECT;
% Check if the image device is connected.
[isconnected, Err] = connectInsp;
if (isconnected == 0)
    CurStatus = Status.ERROR;
    return;
end
CurStatus = Status.CONNECTED;

% CHECKRESOLUTION
CurAction = Action.CHECKRESOLUTION;
% Create the variable 'vid' for displaying the image.
[ID, isresolution, Err]= resolutionInsp;
if (isresolution == 0)
    CurStatus = Status.ERROR;
    return;
end
CurStatus = Status.RESOLUTIONSET;

% BUILD
CurAction = Action.BUILD;
% Build the variable 'vid'.
Vid = videoinput(AdaptorInfo.NAME, ID, AdaptorInfo.FORMAT);
if isempty(Vid)
    CurStatus = Status.ERROR;
    Err = 'Video handle build failed';
end
CurAction = Action.DONE;
CurStatus = Status.DONE;