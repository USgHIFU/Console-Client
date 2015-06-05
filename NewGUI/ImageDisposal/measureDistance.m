%--------------------------------------------------------------------------
%   Display two points on the ultrasound image, and measure the distance
%   between them.
%--------------------------------------------------------------------------
%   AUTHOR: ZHOU Bofan
%   Last modified by ZHOU Bofan APR-22-2015
%--------------------------------------------------------------------------

function [X, Y, Dis] = measureDistance(handles)

% Display the points.
[X, Y] = getline(handles.currentImage);
plot(X, Y, '+', 'MarkerSize', 10);

% Measure the distance.
Dis = sqrt((abs(X(1)-X(2)))^2 + (abs(Y(1)-Y(2)))^2);