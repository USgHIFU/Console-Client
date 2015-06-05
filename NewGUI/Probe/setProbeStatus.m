function setProbeStatus(hFigure,status)

Probe = getappdata(hFigure,'probe');
Probe.CurrentStatus = status;
setappdata(hFigure,'probe',Probe);