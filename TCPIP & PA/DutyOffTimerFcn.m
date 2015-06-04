function DutyOffTimerFcn(hObject,eventdata,hFigure)

PeriodUnit = 1000;
CycleUnit = 100;

handles = guidata(hFigure);
Timer = getappdata(hFigure,'timer');
CurrentSpotInfo = getappdata(hFigure,'current_spot_info');
disp(CurrentSpotInfo.off);
ID_MAX = 112;
DO = getappdata(hFigure,'DO');
Phase = getappdata(hFigure,'phase');
Plan = getappdata(hFigure,'plan');
CoolingTime = Plan.CoolingTime;
SpotNum = Plan.SpotNum;
DutyOn = (Plan.SonicationPeriod / PeriodUnit) .* (Plan.DutyCycle / CycleUnit);
NumOfSonication = Plan.SonicationTime ./ DutyOn;

CurrentSpot = CurrentSpotInfo.spot;
CurrentDutyOn = CurrentSpotInfo.on;
CurrentDutyOff = CurrentSpotInfo.off;

CurrentDutyOff = CurrentDutyOff + 1;
set(handles.status,'String',num2str(CurrentDutyOff));

if CurrentDutyOff < NumOfSonication
    set(Timer.on,'StartDelay',DutyOn);
    EnableDigitalOutput(DO);
    if strcmp(get(Timer.on,'Running'),'off')
        start(Timer.on);
    end
else
    CurrentDutyOn = 0;
    CurrentDutyOff = 0;
    CurrentSpot = CurrentSpot + 1;
    set(handles.status,'String',num2str(CurrentSpot));
    if CurrentSpot < SpotNum        
        set(Timer.cooling,'StartDelay',CoolingTime);
        if strcmp(get(Timer.cooling,'Running'),'off')
            start(Timer.cooling);
        end
        for i=1:ID_MAX
            SendPhaseData(DO,i - 1,Phase(i,CurrentSpot + 1));
            LoadPhaseData(DO);
        end
    else
        resetTimer(Timer);
    end
end

CurrentSpotInfo.spot = CurrentSpot;
CurrentSpotInfo.on = CurrentDutyOn;
CurrentSpotInfo.off = CurrentDutyOff;
setappdata(hFigure,'current_spot_info',CurrentSpotInfo);