function setProbePreviousPosition(hFigure,PrevPos)

Probe = getappdata(hFigure,'probe');
Probe.PrevPos = PrevPos;
setappdata(hFigure,'probe',Probe);