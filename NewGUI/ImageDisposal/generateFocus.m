%--------------------------------------------------------------------------
%   Generate the focus coordinates by the input of the contour points.
%--------------------------------------------------------------------------
%   AUTHOR: ZHOU Bofan
%   Last modified by ZHOU Bofan MAY-5-2015
%--------------------------------------------------------------------------

function [FocusX, FocusY, ImageID] = generateFocus(hFigure)

% Get resolution information.
ResolutionInfo = getResolutionInfo;
Abs = ResolutionInfo.ABS;      % 1024
Ord = ResolutionInfo.ORD;      % 768
AbsDiv = ResolutionInfo.ABSDIV;        % 4
OrdDiv = ResolutionInfo.ORDDIV;        % 12
X_grid = Abs/AbsDiv;        % 1024/4 = 256
Y_grid = Ord/OrdDiv;        % 768/12 = 64

Grid = createGrid;

TreatPlan = getappdata(hFigure, 'TreatPlan');

FocusX = [];
FocusY = [];

% Select a chosen image and its contour handle to build according
% treatment plan and rectangles.
[ImageID, v] = listdlg('Name', '治疗计划选择', 'Promptstring', '选择要显示的角度:', ...
    'selectionmode', 'single', 'listsize', [300 400], 'liststring', ...
    TreatPlan.Angle);
ContourPoints = TreatPlan.ContourPoints{ImageID};

% Loop for all the division, for the division (i, j).
for j = 1 : Y_grid
    for i = 1 : X_grid
        % Create X and Y.
        center = Grid{i,j};
        UL = [center(1)-AbsDiv/2 center(2)-OrdDiv/2]; % Upperleft
        UR = [center(1)+AbsDiv/2 center(2)-OrdDiv/2]; % Upperright
        LL = [center(1)-AbsDiv/2 center(2)+OrdDiv/2]; % Lowleft
        LR = [center(1)+AbsDiv/2 center(2)+OrdDiv/2]; % Lowright
        X = [UL(1) UR(1) LL(1) LR(1)];
        Y = [UL(2) UR(2) LL(2) LR(2)];
        
        % Create xv and yv.
        xv = ContourPoints(:,1);
        xv = [xv ; xv(1)];
        yv = ContourPoints(:,2);
        yv = [yv ; yv(1)];
        
        % Check if the points are in the rectangle.
        IN = inpolygon(X, Y, xv, yv);
        if (IN(1)==1) && (IN(2)==1) && (IN(3)==1) && (IN(4)==1)
            FocusX = [FocusX; center(1)];
            FocusY = [FocusY; center(2)];
        end
    end
end

setappdata(hFigure, 'TreatPlan', TreatPlan);