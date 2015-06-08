function startSonication(hFigure)

PeriodUnit = 1000;
CycleUnit = 100;
Plan = getappdata(hFigure,'plan');
DutyOn = (Plan.SonicationPeriod / PeriodUnit) .* (Plan.DutyCycle / CycleUnit);

if existPowerAmp(hFigure)
    PowerAmp = getappdata(hFigure,'power_amp');
    startAllPowerAmp(PowerAmp,Plan.Voltage);
else
    return
end

for i=1:Plan.SpotNum
    [Voltage(:,i),Phase(:,i)] = PhaseInfo(1,Plan.SpotPosX(i),...
                                            Plan.SpotPosY(i),...
                                            Plan.SpotPosZ(i));
end
setappdata(hFigure,'phase',Phase);

setCurrentSpotInfo(hFigure);
CurrentSpotInfo = getappdata(hFigure,'current_spot_info');
CurrentSpot = CurrentSpotInfo.spot;
DO = getappdata(hFigure,'DO');
ID_MIN = 1;
ID_MAX = 112;
for i=ID_MIN:ID_MAX
    SendPhaseData(DO,i-1,Phase(i,CurrentSpot + 1));
    LoadPhaseData(DO);
end

setSonicationTimer(hFigure);
Timer = getappdata(hFigure,'timer');
set(Timer.on,'StartDelay',DutyOn);
EnableDigitalOutput(DO);
start(Timer.on);