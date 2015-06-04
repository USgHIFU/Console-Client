function setCurrentSpotInfo(hFigure)

CurrentSpot = 0;
CurrentDutyOn = 0;
CurrentDutyOff = 0;

CurrentSpotInfo = struct('on',CurrentDutyOn,...
    'off',CurrentDutyOff,...
    'spot',CurrentSpot);

setappdata(hFigure,'current_spot_info',CurrentSpotInfo);