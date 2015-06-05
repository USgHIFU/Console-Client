%--------------------------------------------------------------------------
% Stop the preview of ultrasound image.
%--------------------------------------------------------------------------
%   AUTHOR: ZHOU Bofan
%   Last modified by ZHOU Bofan APR-29-2015
%--------------------------------------------------------------------------

function stopPreview(Vid)
if isvalid(Vid)    
    stoppreview(Vid);
else
    ;
end