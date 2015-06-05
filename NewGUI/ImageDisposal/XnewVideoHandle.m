%--------------------------------------------------------------------------
%   Every time a function calls for the videoinput handle 'Vid', check if 
%   the variable exists, if not, create it.
%--------------------------------------------------------------------------
%   AUTHOR: ZHOU Bofan
%   Last modified by ZHOU Bofan APR-14-2015
%--------------------------------------------------------------------------

function [Vid, CurStatus, CurAction, Err] = newVideoHandle(hFigure)

CurStatus = 99;
CurAction = 0;
Err = 'Unknown';

Status = getimageInitStatus;
Action = getimageInitAction;
AdaptorInfo = getAdaptorInfo;
CurStatus = Status.RAW;

% CHECK_VALID
CurAction = Action.CHECK_VALID;
% Check if the variable 'Vid' is already created.
Image = getappdata('hFigure', Image);
isValid = isvalid(Image.Vid);