%--------------------------------------------------------------------------
%   Check if a point is in the interior area of a rectangle.
%--------------------------------------------------------------------------
%   AUTHOR: ZHOU Bofan
%   Last modified by ZHOU Bofan MAY-4-2015
%--------------------------------------------------------------------------

function IfIn = ifInRect(x, y, uppleft, lowright)

if (x <= lowright(1)) && (x >= uppleft(1))...
        && (y >= uppleft(2)) && (y <= lowright(2))
    IfIn = 1;
else
    IfIn = 0;
end