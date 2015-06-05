%--------------------------------------------------------------------------
%   Save one-frame image of ultrasound monitor.
%--------------------------------------------------------------------------
%   AUTHOR: ZHOU Bofan
%   Last modified by ZHOU Bofan APR-14-2015
%--------------------------------------------------------------------------

function [CurStatus, CurAction, Err] = saveOneFrame(Vid)

% Data initialization.
CurStatus = 99;
CurAction = 0;
Err = 'Unknown';

% Data acquisition.
% Success = 0; // Need or need not?
Status = getsaveOneFrameStatus;
Action = getsaveOneFrameAction;
CurStatus = Status.RAW;

% CHECK
CurAction = Action.CHECK;
% Check if the input argument 'vid' is empty.
if (isvalid(Vid))
    CurStatus = Status.OBTAINED;
else
    CurStatus = Status.ERROR;
    Err = 'Video handle build failed';
    return;
    % set(hFigure.saveOneFrame, 'Enable', 'inactive'); // Add to GUI
end

% SAVE
CurAction = Action.SAVE;
% -------------
% % Save the current real-time image as a one frame image file.
% F = getframe(screen);
% % ------ Here still lack the interface to get the data of angle-------
% ImageString = datestr(now, 30);
% FileName = strcat(ImageString, '.bmp');
% imwrite(F.cdata, FileName, 'bmp');
% -------------
[Success, FileName, Err] = saveImage(Vid, '7.5');
if (Success == 0)
    CurStatus = Status.ERROR;
    return;
end
CurStatus = Status.SAVEFINISHED;

% CHECKEXISTENCE
CurAction = Action.CHECKEXISTENCE;
% Check the existence of the image file, to make sure the file has been
% well created.
FileExist = exist(FileName, 'file');
if (FileExist == 2)
    CurStatus = Status.DONE;
    CurAction = Action.DONE;
else
    CurStatus = Status.ERROR;
    Err = 'Image file save failed!';
    return;
end
    