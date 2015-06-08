function stopSonication(hFigure)

resetSonicationTimer(hFigure);

DO = getappdata(hFigure,'DO');
DisableDigitalOutput(DO);

if existPowerAmp(hFigure)
    PowerAmp = getappdata(hFigure,'power_amp');
    resetAllPowerAmp(PowerAmp);
end