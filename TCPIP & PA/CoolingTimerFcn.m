function CoolingTimerFcn(hObject,eventdata,hFigure)

PeriodUnit = 1000;
CycleUnit = 100;

Plan = getappdata(hFigure,'plan');
Timer = getappdata(hFigure,'timer');
CurrentSpotInfo = getappdata(hFigure,'current_spot_info');
disp(CurrentSpotInfo.spot);
DO = getappdata(hFigure,'DO');
DutyOn = (Plan.SonicationPeriod / PeriodUnit) .* (Plan.DutyCycle / CycleUnit);

set(Timer.on,'StartDelay',DutyOn);
EnableDigitalOutput(DO);
if strcmp(get(Timer.on,'Running'),'off')
    start(Timer.on);
end