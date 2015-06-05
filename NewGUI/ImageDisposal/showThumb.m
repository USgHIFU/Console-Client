%--------------------------------------------------------------------------
%   When the slider changes its value, reload the thumbnails.
%--------------------------------------------------------------------------
%   AUTHOR: ZHOU Bofan
%   Last modified by ZHOU Bofan MAY-13-2015
%--------------------------------------------------------------------------

function [Thumbnail1, Thumbnail2, Thumbnail3, Thumbnail4, CurSts, CurAct, Err] ...
    = showThumb(handles, Value)

hFigure = handles.hFigure;
Image = getappdata(hFigure, 'Image');

ValueStr1 = num2str((Value-1)*2.5);
ValueStr2 = num2str((Value)*2.5);
ValueStr3 = num2str((Value+1)*2.5);
ValueStr4 = num2str((Value+2)*2.5);

[Thumbnail1, CurSts, CurAct, Err] = thumbnail(handles, 1, ValueStr1);
[Thumbnail2, CurSts, CurAct, Err] = thumbnail(handles, 2, ValueStr2);
[Thumbnail3, CurSts, CurAct, Err] = thumbnail(handles, 3, ValueStr3);
[Thumbnail4, CurSts, CurAct, Err] = thumbnail(handles, 4, ValueStr4);

Image.Thumbnail.Handle = [Thumbnail1; Thumbnail2; Thumbnail3; Thumbnail4];
Image.Thumbnail.Number = {ValueStr1; ValueStr2; ValueStr3; ValueStr4};

% set(Thumbnail1, 'ButtonDownFcn', {@thumbnail_ButtonDownFcn, handles});
% set(Thumbnail2, 'ButtonDownFcn', {@thumbnail_ButtonDownFcn, handles});
% set(Thumbnail3, 'ButtonDownFcn', {@thumbnail_ButtonDownFcn, handles});
% set(Thumbnail4, 'ButtonDownFcn', {@thumbnail_ButtonDownFcn, handles});

setappdata(hFigure, 'Image', Image);