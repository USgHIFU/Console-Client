%--------------------------------------------------------------------------
%   Convert the abnormal coordinates data into the final normal point
%   coordinates.
%--------------------------------------------------------------------------
%   AUTHOR: ZHOU Bofan
%   Last modified by ZHOU Bofan MAY-16-2015
%--------------------------------------------------------------------------

%%%%%%%%%%%%%%%
% SAMEPLE
%%%%%%%%%%%%%%%

function [FinX, FinY, FinZ] = convertCoordinates(IniX, IniY, Angle)

Depth = 143;
XCenter = 200;

% Create vectors.
Length = length(IniX);
FinX = linspace(0,0,Length)';
FinY = linspace(0,0,Length)';
FinZ = linspace(0,0,Length)';

% Loop
for i = 1:Length
    FinZ(i) = IniY(i) + Depth;
    FinX(i) = (IniX(i) - XCenter)*cos(Angle);
    FinY(i) = (IniX(i) - XCenter)*sin(Angle);
end