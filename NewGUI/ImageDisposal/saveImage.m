%--------------------------------------------------------------------------
%   Save current synchronous ultrasound image, create the directory and
%   name of the image file.

%   Subroutine of function 'saveImage'.
%--------------------------------------------------------------------------
%   AUTHOR: ZHOU Bofan
%   Last modified by ZHOU Bofan APR-14-2015
%--------------------------------------------------------------------------

function [Success, FileName, Err] = saveImage(Vid, ID)

Success = 0;
Err = 'Unknown';

% Create the directory and the name for the image file.
% ImageString = datestr(now, 30);
FileName = strcat(ID, '.bmp');

% Check if vid is empty.
if ~(isvalid(Vid))
    Err = 'Image handle build error!';
    Success = 0;
    return
end

% Catch the frame and save.
Frame = getsnapshot(Vid);
imwrite(Frame, FileName, 'bmp');

Success = 1;
Err = 'None';


