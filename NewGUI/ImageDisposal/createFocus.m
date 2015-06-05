%--------------------------------------------------------------------------
%   This function checks if a rectangle division is in the contour of 
%   treatment plan, thus gets the treatment area and the coordinate of
%   each focus.
%--------------------------------------------------------------------------
%   AUTHOR: ZHOU Bofan
%   Last modified by ZHOU Bofan APR-19-2015
%--------------------------------------------------------------------------

function [FocusX FocusY ContourHandle] = createFocus()

% IN = inpolygon(X, Y, xv, yv);

ResolutionInfo = getResolutionInfo;
Abs = ResolutionInfo.ABS;      % 1024
Ord = ResolutionInfo.ORD;      % 768
AbsDiv = ResolutionInfo.ABSDIV;        % 4
OrdDiv = ResolutionInfo.ORDDIV;        % 12
X_grid = Abs/AbsDiv;        % 1024/4 = 256
Y_grid = Ord/OrdDiv;        % 768/12 = 64

Grid = createGrid;              % Create Grid.
ContourHandle = selectRegion();     % Get the contour.

FocusX = [];
FocusY = [];

% Loop for all the division,for the division (i, j).
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
        ContourPoints = getPosition(ContourHandle);
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


