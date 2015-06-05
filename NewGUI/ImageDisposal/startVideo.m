%--------------------------------------------------------------------------
% Start record the video.
%--------------------------------------------------------------------------
%   AUTHOR: ZHOU Bofan
%   Last modified by ZHOU Bofan APR-26-2015
%--------------------------------------------------------------------------

function [Success, FileName, CurStatus, CurAction, Err] = startVideo(Vid)

Status = getstartVideoStatus;
Action = getstartVideoAction;
Success = 0;
Err = 'Unknown';
CurStatus = Status.RAW;

profile on
profile -history

% CHECK
CurAction = Action.CHECK;
% Check if the image handle 'vid' is empty.
if (isempty(Vid))
    Err = 'Image handle build error!';
    return;
end
CurStatus = Status.CHECKED;

% START
CurAction = Action.START;
% Start to film the video.
% Choose the storing device.
Dir = uigetdir;
FilaName = datestr(now, 30);
Vid.FramesPerTrigger = Inf;
Vid.LoggingMode = 'disk';
% Appoint the directory to save the video.
FileName = strcat(Dir, FilaName);
diskLogger = VideoWriter(FileName, 'MPEG-4');
Vid.DiskLogger = diskLogger;
diskLogger.FrameRate = 22;
preview(Vid);
start(Vid);
CurStatus = Status.STARTED;

Success = 1;
Err = 'None';
CurAction = Action.FILMING;
CurStatus = Status.DONE;