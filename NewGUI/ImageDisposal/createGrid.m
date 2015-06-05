%--------------------------------------------------------------------------
%   Create a standard grid to generate the focus information.
%--------------------------------------------------------------------------
%   AUTHOR: ZHOU Bofan
%   Last modified by ZHOU Bofan APR-15-2015
%--------------------------------------------------------------------------

function Grid = createGrid()

% Load constant data.
ResolutionInfo = getResolutionInfo;

Abs = ResolutionInfo.ABS;      % 1024
Ord = ResolutionInfo.ORD;      % 768
AbsDiv = ResolutionInfo.ABSDIV;        % 4
OrdDiv = ResolutionInfo.ORDDIV;        % 12
X_grid = Abs/AbsDiv;        % 1024/4 = 256
Y_grid = Ord/OrdDiv;        % 768/12 = 64

% Create new cell object to store the coordinates
% of each division center.
Grid = cell(X_grid, Y_grid);

for i = 1 : X_grid
    for j = 1 : Y_grid
        Grid(i, j)  = {[AbsDiv/2+AbsDiv*(i-1), OrdDiv/2+OrdDiv*(j-1)]};
    end
end