function varargout = Rotation(varargin)
% ROTATION MATLAB code for Rotation.fig
%      ROTATION, by itself, creates a new ROTATION or raises the existing
%      singleton*.
%
%      H = ROTATION returns the handle to a new ROTATION or the handle to
%      the existing singleton*.
%
%      ROTATION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ROTATION.M with the given input arguments.
%
%      ROTATION('Property','Value',...) creates a new ROTATION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Rotation_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Rotation_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Rotation

% Last Modified by GUIDE v2.5 05-Apr-2015 14:31:22

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Rotation_OpeningFcn, ...
                   'gui_OutputFcn',  @Rotation_OutputFcn, ...
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


% --- Executes just before Rotation is made visible.
function Rotation_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Rotation (see VARARGIN)

% Choose default command line output for Rotation
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Rotation wait for user response (see UIRESUME)
% uiwait(handles.rotation);


% --- Outputs from this function are returned to the command line.
function varargout = Rotation_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in reset.
function reset_Callback(hObject, eventdata, handles)
% hObject    handle to reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

hFigure = handles.rotation;

Action = getProbeAction;
Status = getProbeStatus;

if existProbe(hFigure)
    Probe = getappdata(hFigure,'probe');
    setProbeAction(hFigure,Action.CHECK);
else
    set(handles.status,'String',Status.EXCEPTION);
    return
end

if resetProbe(Probe)
    setProbeStatus(hFigure,Status.CHECKED);
    setProbeAction(hFigure,[]);
    setProbePreviousPosition(hFigure,'90');
    set(handles.status,'String','SUCCESS');
else
    set(handles.status,'String',Status.EXCEPTION);
end


% --- Executes on button press in query.
function query_Callback(hObject, eventdata, handles)
% hObject    handle to query (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
hFigure = handles.rotation;

Action = getProbeAction;
Status = getProbeStatus;

if existProbe(hFigure)
    Probe = getappdata(hFigure,'probe');
    setProbeAction(hFigure,Action.QUERY);
else
    set(handles.status,'String',Status.EXCEPTION);
    return
end

Pos = queryProbe(Probe);

if isempty(Pos)
    set(handles.status,'String',Status.EXCEPTION);
else
    setProbePreviousPosition(hFigure,num2str(Pos));
    set(handles.status,'String',num2str(Pos));
end



function nextPosition_Callback(hObject, eventdata, handles)
% hObject    handle to nextPosition (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nextPosition as text
%        str2double(get(hObject,'String')) returns contents of nextPosition as a double


% --- Executes during object creation, after setting all properties.
function nextPosition_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nextPosition (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in rotate.
function rotate_Callback(hObject, eventdata, handles)
% hObject    handle to rotate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
hFigure = handles.rotation;

Action = getProbeAction;
Status = getProbeStatus;

if existProbe(hFigure)
    Probe = getappdata(hFigure,'probe');
    setProbeAction(hFigure,Action.ROTATE);
else
    set(handles.status,'String',Status.EXCEPTION);
    return
end

Pos = queryProbe(Probe);

if isempty(Pos)
    set(handles.status,'String',Status.EXCEPTION);
else
    setProbePreviousPosition(hFigure,num2str(Pos));
end

NextPos = get(handles.nextPosition,'String');
if rotateProbe(Probe,NextPos)    
    setProbeStatus(hFigure,Status.ARRIVED);
    setProbeAction(hFigure,[]);
    set(handles.status,'String','SUCCESS');
else
    set(handles.status,'String',Status.EXCEPTION);
end