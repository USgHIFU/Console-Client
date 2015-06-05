%--------------------------------------------------------------------------
% Start the preview of ultrasound image.
%--------------------------------------------------------------------------
%   AUTHOR: ZHOU Bofan
%   Last modified by ZHOU Bofan APR-08-2015
%--------------------------------------------------------------------------

function Video = saveVideo(handles, Value)

Data_saveVideo.Status = saveVideo_Status;
Data_saveVideo.Action = saveVideo_Action;
Data_saveVideo.CurrentStatus = Data_saveVideo.Status.RAW;
vid = handles.vid;

% CHECK
Data_saveVideo.CureentAction = Data_saveVideo.Action.CHECK;
% Check if the input argument 'vid' is empty.
if (vid ~= [])
    Data_saveVideo.CurrentStatus = Data_saveVideo.Status.CHECKED;
else
    Data_saveVideo.CurrentStatus = Data_saveVideo.Status.ERROR;
    set(handles.saveVideo, 'Enable', 'inactive');
end

% START
% Start to film the video.
if (Value)
    Data_saveVideo.CurrentAction = Data_saveVideo.Action.START;
    % Choose the storing device.
    Dir = uigetdir;
    FilaName = datestr(now, 30);
    handles.vid.FramesPerTrigger = Inf;
    handles.vid.LoggingMode = 'disk';
    % Appoint the directory to save the video.
    FileName = strcat(Dir, FilaName);
    diskLogger = VideoWriter(FileName, 'MPEG-4');
    handles.vid.DiskLogger = diskLogger;
    diskLogger.FrameRate = 60;
    start(handles.vid);
    Data_saveVideo.CurrentAction = Data_saveVideo.Status.STARTED;
    
% STOP
else
    Data_saveVideo.CurrentAction = Data_saveVideo.Action.STOP;
    stoppreview(vid);
    stop(handles.vid);
    Data_saveVideo.CurrentStatus = Data_saveVideo.Status.STOPPED;
    
    % SAVING
    Data_saveVideo.CurrentAction = Data_saveVideo.Action.SAVE;
    Data_saveVideo.CurrentStatus = Data_saveVideo.Status.SAVED;
end

