%--------------------------------------------------------------------------
%   Check the probe control connection.
%--------------------------------------------------------------------------
%   AUTHOR: ZHOU Bofan
%   Last modified by ZHOU Bofan APR-22-2015
%--------------------------------------------------------------------------

function isconnect = checkProbe(handles)

hFigure = handles.hFigure;
isconnect = 0;

if existProbe(hFigure)
    Probe = getappdata(hFigure,'probe');
else
    set(handles.currentStatus,'String',Status.EXCEPTION);
    return
end

if resetProbe(Probe)
    setProbeAction(hFigure,[]);
    setProbePreviousPosition(hFigure,'90');
    set(handles.currentStatus,'String','SUCCESS');
    isconnect = 1;
else
    set(handles.currentStatus,'String',Status.EXCEPTION);
end