function setProbeAction(hFigure,Action)

Probe = getappdata(hFigure,'probe');
Probe.CurrentAction = Action;
setappdata(hFigure,'probe',Probe);