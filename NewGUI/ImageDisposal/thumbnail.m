%--------------------------------------------------------------------------
%   Load and display the thumbnails on the major scereen.
%--------------------------------------------------------------------------
%   AUTHOR: ZHOU Bofan
%   Last modified by ZHOU Bofan APR-29-2015
%--------------------------------------------------------------------------

function [ImageHandle, CurSts, CurAct, Err] = thumbnail(handles, ThumbID, ImageID)

% Data initialization.
% Success = 0;
CurSts = 99;
CurAct = 0;
Err = 'Unknown';

% Data acquisition.
Status = getthumbnailStatus;
Action = getthumbnailAction;
CurSts = Status.RAW;

% CHECKEXISTENCE
CurAct = Action.CHECKEXSITENCE;
% Check if the image file indicated by the input variable exist.
FileName = strcat(ImageID, '.bmp');
FileExist = exist(FileName, 'file');
if (FileExist == 2)
    CurSts = Status.EXISTCHECKED;
else
    CurSts = Status.ERROR;
    Err = 'Image file does not exist !';
    return;
end

% LOAD
CurAct = Action.LOAD;
% Load the image file to matlab memory.
Image = imread(FileName);
CurSts = Status.LOADED;

% DISPLAY
CurAct = Action.DISPLAY;
switch ThumbID
    case 1
        axes(handles.thumbnail1);
        ImageHandle = imshow(Image);
        set(handles.thumbText1, 'String', ImageID);
    case 2
        axes(handles.thumbnail2);
        ImageHandle = imshow(Image);
        set(handles.thumbText2, 'String', ImageID);
    case 3
        axes(handles.thumbnail3);
        ImageHandle = imshow(Image);
        set(handles.thumbText3, 'String', ImageID);
    case 4
        axes(handles.thumbnail4);
        ImageHandle = imshow(Image);
        set(handles.thumbText4, 'String', ImageID);
end
CurSts = Status.DONE;
CurAct = Action.DONE;
Err = 'None';
% Success = 1;
