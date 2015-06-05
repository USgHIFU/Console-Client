%--------------------------------------------------------------------------
%   Draw the rectangle areas of the TP on the ultrasound image.
%--------------------------------------------------------------------------
%   AUTHOR: ZHOU Bofan
%   Last modified by ZHOU Bofan MAY-5-2015
%--------------------------------------------------------------------------

function RectHandle = drawRectangle(X, Y, handles)

ResolutionInfo = getResolutionInfo;
Absdiv = ResolutionInfo.ABSDIV;
Orddiv = ResolutionInfo.ORDDIV;

% Check if the image of focus exists, which means if this button
% has been already pressed before, delete the elder handle, then generate a 
% new one.

% hFigure = handles.hFigure;
% TreatPlan = getappdata(hFigure, 'TreatPlan');
% RectHandle = TreatPlan.RectHandle;

% if ~isempty(RectHandle)
%     delete(RectHandle)
% end

PointNumber = length(X);
RectHandle = linspace(0,0,PointNumber);

for i = 1 : PointNumber
    Xi = X(i);
    Yi = Y(i);
    RectHandle(i) = rectangle('Position',  [Xi-Absdiv/2, Yi-Orddiv/2, Absdiv, Orddiv], ...
                              'LineWidth', 1, ...
                              'EdgeColor', 'yellow'                                        );
end