function deleteProbe(hFigure)

if existProbe(hFigure)
    Probe = getappdata(hFigure,'probe');
    deleteSerial(Probe.Serial);
    Probe = [];
    setappdata(hFigure,'probe',Probe);
end
    