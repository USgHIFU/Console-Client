%--------------------------------------------------------------------------
%   Draw the contour of the treatment plan on the ultrasound image.
%--------------------------------------------------------------------------
%   AUTHOR: ZHOU Bofan
%   Last modified by ZHOU Bofan MAY-5-2015
%--------------------------------------------------------------------------

function ContourHandle = selectRegion(handles)

% Load the image.
% image = imread('1280.768.jpg');
% figure, plot(1:10);
% imshow(image);

% Check if the handle of contour already exists, which means if this button
% has been already pressed before, delete the elder handle, then generate a 
% new one.

hFigure = handles.hFigure;
TreatPlan = getappdata(hFigure, 'TreatPlan');
% ContourHandle = TreatPlan.ContourHandle;
% 
% if ~isempty(ContourHandle)
%     delete(ContourHandle)
% end

% Select and store the ROI.
ContourHandle = imfreehand;