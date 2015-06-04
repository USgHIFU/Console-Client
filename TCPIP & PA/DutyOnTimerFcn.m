function DutyOnTimerFcn(hObject,eventdata,hFigure)

PeriodUnit = 1000;
CycleUnit = 100;

handles = guidata(hFigure);

Timer = getappdata(hFigure,'timer');
CurrentSpotInfo = getappdata(hFigure,'current_spot_info');
disp(CurrentSpotInfo.on);
DO = getappdata(hFigure,'DO');
Plan = getappdata(hFigure,'plan');
DutyOff = Plan.SonicationPeriod * (1 - Plan.DutyCycle / CycleUnit) / PeriodUnit;

CurrentSpotInfo.on = CurrentSpotInfo.on + 1;
set(handles.status,'String',num2str(CurrentSpotInfo.on));
set(Timer.off,'StartDelay',DutyOff);
setappdata(hFigure,'current_spot_info',CurrentSpotInfo);

DisableDigitalOutput(DO);
if strcmp(get(Timer.off,'Running'),'off')
    start(Timer.off);
end