%--------------------------------------------------------------------------
%   GUI module.
%--------------------------------------------------------------------------
%   AUTHOR: ZHOU Bofan
%   Last modified by ZHOU Bofan MAY-19-2015
%--------------------------------------------------------------------------

function varargout = GUI_ImageDisposal(varargin)
% GUI_IMAGEDISPOSAL MATLAB code for GUI_ImageDisposal.fig
%      GUI_IMAGEDISPOSAL, by itself, creates a new GUI_IMAGEDISPOSAL or raises the existing
%      singleton*.
%
%      H = GUI_IMAGEDISPOSAL returns the handle to a new GUI_IMAGEDISPOSAL or the handle to
%      the existing singleton*.
%
%      GUI_IMAGEDISPOSAL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_IMAGEDISPOSAL.M with the given input arguments.
%
%      GUI_IMAGEDISPOSAL('Property','Value',...) creates a new GUI_IMAGEDISPOSAL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_ImageDisposal_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_ImageDisposal_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI_ImageDisposal

% Last Modified by GUIDE v2.5 26-May-2015 14:38:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_ImageDisposal_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_ImageDisposal_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before GUI_ImageDisposal is made visible.
function GUI_ImageDisposal_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI_ImageDisposal (see VARARGIN)

% TCP initialisation
Client = newClient;
setappdata(hObject,'client',Client);

% ---INITIALISATION---
% Initialisation of image data.
hFigure = handles.hFigure;
axes(handles.currentImage); %hold on;

[Vid, Sts, Act, Err] = imageInit;
if isvalid(Vid)
    Image.Vid = Vid;
    Image.Angle = [];
    setappdata(hFigure, 'Image', Image);
else
    errordlg(Err, 'Error occured!', 'on');
end

% Initialize the TreatPlan class.
TreatPlan = initTreatPlan(handles);
setappdata(hFigure, 'TreatPlan', TreatPlan);

% Initialize the Log class.
handles.CurSts = 99;
handles.CurAct = 0;
handles.Err = '';

% Choose default command line output for GUI_ImageDisposal
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI_ImageDisposal wait for user response (see UIRESUME)
% uiwait(handles.hFigure);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_ImageDisposal_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function slider_Callback(hObject, eventdata, handles)
% hObject    handle to slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

Value = get(hObject, 'Value');
ValueInt = ceil(Value);
set(handles.currentStatus, 'string', num2str(ValueInt));
[Thumbnail1, Thumbnail2, Thumbnail3, Thumbnail4, CurSts, CurAct, Err] ...
    = showThumb(handles, ValueInt);

set(Thumbnail1, 'ButtonDownFcn', {@thumbnail_ButtonDownFcn, handles});
set(Thumbnail2, 'ButtonDownFcn', {@thumbnail_ButtonDownFcn, handles});
set(Thumbnail3, 'ButtonDownFcn', {@thumbnail_ButtonDownFcn, handles});
set(Thumbnail4, 'ButtonDownFcn', {@thumbnail_ButtonDownFcn, handles});

set(handles.slider, 'Enable', 'on');
handles.CurSts = CurSts;
handles.CurAct = CurAct;
handles.Err = Err;
guidata(hObject, handles);
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in preview.
function preview_Callback(hObject, eventdata, handles)
% hObject    handle to preview (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of preview

% Click this button will start the preview of the image.
% set(handles.currentImage,'NextPlot','add');
 % Set currentImage as axed_src.
hFigure = handles.hFigure;

axes(handles.currentImage);
Image = getappdata(hFigure, 'Image');

IfPreview = get(hObject, 'Value');
if (IfPreview)
    cla;    
    startPreview(Image.Vid);
    drawLine;    
else
    stopPreview(Image.Vid);
end

% Enable the button of saving image and start video.
set(handles.saveOneFrame, 'Enable', 'on');
set(handles.saveVideo, 'Enable', 'on');

guidata(hObject, handles);


% --- Executes on button press in saveOneFrame.
function saveOneFrame_Callback(hObject, eventdata, handles)
% hObject    handle to saveOneFrame (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

hFigure = handles.hFigure;

Image = getappdata(hFigure, 'Image'); % Get video from handles.
screen = handles.currentImage; % Set the axis to save the image.

% Save the one-frame image and change the related GUI elements.
[Sts, Act, Err] = saveOneFrame(Image.Vid);
if (Sts == 100)
    edit = 'Image save finished!';
else
    edit = Err;
end
set(handles.currentStatus, 'String', edit);

handles.CurSts = CurSts;
handles.CurAct = CurAct;
handles.Err = Err;
guidata(hObject, handles);


% --- Executes on button press in saveVideo.
function saveVideo_Callback(hObject, eventdata, handles)
% hObject    handle to saveVideo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of saveVideo

hFigure = handles.hFigure;
Image = getappdata(hFigure,'Image');
Vid = Image.Vid;

IfPreview = get(hObject, 'Value');
if (IfPreview)
    [Success, FileName, CurSts, CurAct, Err]= startVideo(Vid);
    Image.VideoName = FileName;
    setappdata(hFigure,'Image',Image);
else
    [Success, CurSts, CurAct, Err] = stopVideo(Vid, Image.VideoName);
end

handles.CurSts = CurSts;
handles.CurAct = CurAct;
handles.Err = Err;
guidata(hObject, handles);


% --- Executes on button press in selectRegion.
function selectRegion_Callback(hObject, eventdata, handles)
% hObject    handle to selectRegion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

axes(handles.currentImage); % Set currentImage as axed_src.
hFigure = handles.hFigure;
TreatPlan = getappdata(hFigure, 'TreatPlan');

ContourHandle = selectRegion(handles);
ContourPoints = getPosition(ContourHandle);
if isempty(TreatPlan.ContourPoints)
    TreatPlan.ContourPoints{1} = ContourPoints;
else
    TreatPlan.ContourPoints = [TreatPlan.ContourPoints, ContourPoints];
end
TreatPlan.Angle = [TreatPlan.Angle, handles.CurAngle];

setappdata(hFigure, 'TreatPlan', TreatPlan);
guidata(hObject,handles);


% --- Executes on button press in showTP.
function showTP_Callback(hObject, eventdata, handles)
% hObject    handle to showTP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

hFigure = handles.hFigure;
TreatPlan = getappdata(hFigure, 'TreatPlan');

% Generate focus coordinates and save them into appdata.
[X, Y, ImageID] = generateFocus(handles);
TreatPlan.FocusCenterX{ImageID} = X;
TreatPlan.FocusCenterY{ImageID} = Y;

% Display the focus.
axes(handles.currentImage); % Set currentImage as axed_src.
RectHandle = drawRectangle(TreatPlan.FocusCenterX{ImageID}, ...
    TreatPlan.FocusCenterY{ImageID}, handles);
TreatPlan.RectHandle{ImageID} = RectHandle;

setappdata(hFigure, 'TreatPlan', TreatPlan);
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function editAngle_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editAngle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function textAngleValue_CreateFcn(hObject, eventdata, handles)
% hObject    handle to textAngleValue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in measureDistance.
function measureDistance_Callback(hObject, eventdata, handles)
% hObject    handle to measureDistance (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

axes(handles.currentImage); hold on;

[X, Y, Dis] = measureDistance(handles);
set(handles.currentStatus,'String',Dis);


% --- Executes on button press in saveOverallImage.
function saveOverallImage_Callback(hObject, eventdata, handles)
% hObject    handle to saveOverallImage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

hFigure = handles.hFigure;

Image = getappdata(hFigure, 'Image'); % Get video from handles.
Vid = Image.Vid;
screen = handles.currentImage; % Set the axis to save the image.


[Success, CurStatus, CurAction, Err] = saveOverallImage(Vid, handles);

handles.CurSts = CurSts;
handles.CurAct = CurAct;
handles.Err = Err;
guidata(hObject, handles);


% --- Executes on button press in showThumb.
function showThumb_Callback(hObject, eventdata, handles)
% hObject    handle to showThumb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[Thumbnail1, Thumbnail2, Thumbnail3, Thumbnail4, CurSts, CurAct, Err] ...
    = showThumb(handles, 1);
% hFigure = handles.hFigure;
% Image = getappdata(hFigure, 'Image');
% 
% [Thumbnail1, CurSts, CurAct, Err] = thumbnail(handles, 1, '0');
% [Thumbnail2, CurSts, CurAct, Err] = thumbnail(handles, 2, '2.5');
% [Thumbnail3, CurSts, CurAct, Err] = thumbnail(handles, 3, '5');
% [Thumbnail4, CurSts, CurAct, Err] = thumbnail(handles, 4, '7.5');
% 
% Image.Thumbnail.Handle = [Thumbnail1; Thumbnail2; Thumbnail3; Thumbnail4];
% Image.Thumbnail.Number = {'0'; '2.5'; '5'; '7.5'};
% 
set(Thumbnail1, 'ButtonDownFcn', {@thumbnail_ButtonDownFcn, handles});
set(Thumbnail2, 'ButtonDownFcn', {@thumbnail_ButtonDownFcn, handles});
set(Thumbnail3, 'ButtonDownFcn', {@thumbnail_ButtonDownFcn, handles});
set(Thumbnail4, 'ButtonDownFcn', {@thumbnail_ButtonDownFcn, handles});
% 
% setappdata(hFigure, 'Image', Image);

handles.CurSts = CurSts;
handles.CurAct = CurAct;
handles.Err = Err;
set(handles.slider, 'Enable', 'on');
guidata(hObject, handles);

% --- Executes on mouse press over axes background.
function thumbnail_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to thumbnail1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Button down function connected with thumbnails, when a thumbnail is 
% clicked, display the corresponding image in the main area.

hFigure = handles.hFigure;
Image = getappdata(hFigure, 'Image');

axes(handles.currentImage);
imshow(get(hObject, 'CData'));
Number = find(Image.Thumbnail.Handle == hObject);
handles.CurAngle = Image.Thumbnail.Number(Number);

guidata(hObject, handles);


% --- Executes on button press in sendPlan.
function sendPlan_Callback(hObject, eventdata, handles)
% hObject    handle to sendPlan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

hFigure = handles.hFigure;
TreatPlan = getappdata(hFigure, 'TreatPlan');

Ini1X = TreatPlan.FocusCenterX{1};
Ini1Y = TreatPlan.FocusCenterY{1};
Angle1 = str2num(TreatPlan.Angle{1});

[FinX, FinY, FinZ] = convertCoordinates(Ini1X, Ini1Y, Angle1);

TreatmentPlan = newTreatmentPlan;
TreatmentPlan.SpotPosX = FinX;
TreatmentPlan.SpotPosY = FinY;
TreatmentPlan.SpotPosZ = FinZ;
TreatmentPlan.SpotNum = length(TreatmentPlan.SpotPosY);
TreatmentPlan.Voltage = 5;
TreatmentPlan.Angle = Angle1;

setappdata(hFigure, 'TreatmentPlan', TreatmentPlan);

IsClientExisting = existClient(hFigure);

if ~IsClientExisting
    return
else
    Client = getappdata(hFigure,'client');
end

SessionType = getSessionType;
Client.SessionType = SessionType.Plan;
setappdata(hFigure,'client',Client);
if startSession(Client.Tcpip,SessionType.Plan)
    set(handles.status,'String','Sending data ...');
    [Success,Err] = sendPlan(Client.Tcpip,TreatmentPlan);
    Success = Success && finishSession(Client.Tcpip);
else
    set(handles.status,'String','Error');
    return
end

if Success
    set(handles.status,'String','Complete the process of sending');
else
    set(handles.status,'String',Err);
end


% --- Executes on button press in startTreatment.
function startTreatment_Callback(hObject, eventdata, handles)
% hObject    handle to startTreatment (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

hFigure = handles.hFigure;
IsClientExisting = existClient(hFigure);

if ~IsClientExisting
    return
else
    Client = getappdata(hFigure,'client');
end
SessionType = getSessionType;
Client.SessionType = SessionType.Command;
setappdata(hFigure,'client',Client);
if startSession(Client.Tcpip,SessionType.Command)
    set(handles.status,'String','STARTING...');
    Cmd = getCommand;
    Success = sendCommand(Client.Tcpip,Cmd.Start);
    Success = Success && finishSession(Client.Tcpip);
else
    set(handles.status,'String','Error');
    return
end

if Success
    set(handles.status,'String','STARTED');
else
    set(handles.status,'String','Error');
end


% --- Executes on button press in stopTreatment.
function stopTreatment_Callback(hObject, eventdata, handles)
% hObject    handle to stopTreatment (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

hFigure = handles.hFigure;
IsClientExisting = existClient(hFigure);

if ~IsClientExisting
    return
else
    Client = getappdata(hFigure,'client');
end
SessionType = getSessionType;
Client.SessionType = SessionType.Command;
setappdata(hFigure,'client',Client);
if startSession(Client.Tcpip,SessionType.Command)
    set(handles.status,'String','STOPPING ...');
    Cmd = getCommand;
    Success = sendCommand(Client.Tcpip,Cmd.Stop);
    Success = Success && finishSession(Client.Tcpip);
else
    set(handles.status,'String','Error');
    return
end

if Success
    set(handles.status,'String','STOPPED');
else
    set(handles.status,'String','Error');
end


% --- Executes on button press in rotateProbe.
function rotateProbe_Callback(hObject, eventdata, handles)
% hObject    handle to rotateProbe (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

hFigure = handles.hFiugre;

if existProbe(hFigure)
    Probe = getappdata(hFigure, 'probe');
    setProbeAction(hFigure, Action.ROTATE);
else
    set(handles.status, 'String', 'Probe Error');
    return
end

Pos = queryProbe(Probe);

if isempty(Pos)
    set(handles.currentStatus, 'String', Status.EXCEPTION);
else
    setProbePreviousPosition(hFigure, num2str(Pos));
end

NextPos = get(handles.editAngle, 'String');
if rotateProbe(Probe, NextPos)    
    setProbeStatus(hFigure, Status.ARRIVED);
    setProbeAction(hFigure, []);
    set(handles.status, 'String', 'SUCCESS');
else
    set(handles.status, 'String', 'Probe Error');
end
