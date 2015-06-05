%--------------------------------------------------------------------------
% Stop record the video and save.
%--------------------------------------------------------------------------
%   AUTHOR: ZHOU Bofan
%   Last modified by ZHOU Bofan APR-26-2015
%--------------------------------------------------------------------------

function [Success, CurStatus, CurAction, Err] = stopVideo(Vid, FileName)

Success = 0;
Err = 'Unknown';
Status = getstopVideoStatus;
Action = getstopVideoAction;
CurStatus = Status.RAW;

% CHECK
CurAction = Action.CHECK;
% Check if the image handle 'vid' is empty.
if (isempty(Vid))
    Err = 'Image handle build error!';
    return;
end
CurStatus = Status.CHECKED;

% STOP
CurAction = Action.STOP;
% Stop filming the video and save.
stoppreview(Vid);
stop(Vid);
CurStatus = Status.STOPPED;

% CHECKEXISTENCE
CurAction = Action.CHECKEXISTENCE;
% Check the existence of the video file, to make sure the file has been
% well created.
FileExist = exist(FileName, 'file');
if (FileExist == 2)
    CurStatus = Status.DONE;
    CurAction = Action.DONE;
else
    CurStatus = Status.ERROR;
    Err = 'Video file save failed !';
    return;
end