%--------------------------------------------------------------------------
%   Convert the abnormal coordinates data into the final normal point
%   coordinates.
%--------------------------------------------------------------------------
%   AUTHOR: ZHOU Bofan
%   Last modified by ZHOU Bofan MAY-16-2015
%--------------------------------------------------------------------------

function [Success, CurSts, CurAct, Err] = deliveryTreatPlan(handles)

% Initialize.
CurStatus = 99;
CurAction = 0;
Err = 'Unknown';
Success = 0;

% Data acquisition.
hFigure = handles.hFigure;
TreatPlan = getappdata(hFigure, 'TreatPlan');

% Data transformation.
for i = 1:4
    [FinX, FinY, FinZ] = convertCoordinates(TreatPlan.FocusCenterX{i}, ...
    TreatPlan.FocusCenterY{i}, Angle);
end