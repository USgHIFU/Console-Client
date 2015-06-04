function StopTimerFcn(obj,event,hFigure)

DO = getappdata(hFigure,'DO');
Timer = getappdata(hFigure,'timer');
resetTimer(Timer);
DisableDigitalOutput(DO);
if existPowerAmp(hFigure)
    PowerAmp = getappdata(hFigure,'power_amp');
    resetAllPowerAmp(PowerAmp);
end