%--------------------------------------------------------------------------
%   Get and save 180 degree ultrasound images.
%--------------------------------------------------------------------------
%   AUTHOR: ZHOU Bofan
%   Last modified by ZHOU Bofan MAY-5-2015
%--------------------------------------------------------------------------

function [Success, CurStatus, CurAction, Err] = saveOverallImage(Vid, handles)

% Initialize.
CurStatus = 99;
CurAction = 0;
Err = 'Unknown';
Success = 0;

% Data acquisition.
hFigure = handles.hFigure;

Status = getsaveOverallImageStatus;
Action = getsaveOverallImageAction;
CurStatus = Status.RAW;

% CHECKVID
CurAction = Action.CHECKVID;
% Check if the input argument 'vid' is empty.
if (isvalid(Vid))
    CurStatus = Status.OBTAINED;
else
    CurStatus = Status.ERROR;
    Err = 'Video handle build failed !';
    return;
    % set(hFigure.saveOneFrame, 'Enable', 'inactive'); // Add to GUI
end

% CHECKPROBE
CurAction = Action.CHECKPROBE;
% Check if the probe is connected.
if checkProbe(handles);
    CurStatus = Status.CONNECTED;
else
    CurStatus = Status.ERROR;
    Err = 'Probe initialization failed !';
    return;
end

% SAVE
CurAction = Action.SAVE;
% Save all the ultrasound images of 180 degrees.
for DegreeNum = 0 : 2.5 : 177.5
    DegreeStr = num2str(DegreeNum);
    Probe = getappdata(hFigure, 'probe');
    if rotateProbe(Probe, DegreeStr)
        setProbePreviousPosition(handles.hFigure,DegreeStr);
    else
        CurStatus = Status.ERROR;
        Err = 'Image save failed !';
        return;
    end
    
    [Success, FileName, Err] = saveImage(Vid, DegreeStr); % Save.
    if (Success == 0)
        CurStatus = Status.ERROR;
        return;
    end
    
    FileExist = exist(FileName, 'file'); % Checkexistence
    if (FileExist ~= 2)
        CurStatus = Status.ERROR;
        Err = 'Image file save failed!';
        return;
    end
end

CurStatus = Status.DONE;
CurAction = Action.DONE;
Err = 'None';