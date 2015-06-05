%--------------------------------------------------------------------------
%   Initialize the appdata information of TreatPlan.
%--------------------------------------------------------------------------
%   AUTHOR: ZHOU Bofan
%   Last modified by ZHOU Bofan MAY-5-2015
%--------------------------------------------------------------------------

function TreatPlan = initTreatPlan

TreatPlan.ContourPoints = {};
TreatPlan.Angle = [];
TreatPlan.RectHandle = {[], [], [], []};
TreatPlan.FocusCenterX = {[], [], [], []};
TreatPlan.FocusCenterY = {[], [], [], []};