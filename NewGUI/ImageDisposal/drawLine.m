%--------------------------------------------------------------------------
%   Draw the vertical line on the ultrasound image.
%--------------------------------------------------------------------------
%   AUTHOR: ZHOU Bofan
%   Last modified by ZHOU Bofan APR-14-2015
%--------------------------------------------------------------------------

function Line = drawLine()

Info = getGraphicInfo;
X = Info.VERTICAL_X;
Y = Info.VERTICAL_Y;

Line = line(X, Y);