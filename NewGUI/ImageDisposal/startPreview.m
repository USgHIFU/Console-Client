%--------------------------------------------------------------------------
% Start the preview of ultrasound image.
%--------------------------------------------------------------------------
%   AUTHOR: ZHOU Bofan
%   Last modified by ZHOU Bofan APR-29-2015
%--------------------------------------------------------------------------

function startPreview(Vid)

if isvalid(Vid)    
vidRes = get(Vid, 'VideoResolution'); 
nBands = get(Vid, 'NumberOfBands'); 
hImage = image(zeros(vidRes(2), vidRes(1), nBands)); 
% Vid.ROIPosition = [189 99 593 508];
preview(Vid, hImage);%
else
    [Vid, Sts, Act, Err] = imageInit;
    if isvalid(Vid)
    Image.Vid = Vid;
    setappdata(hFigure, 'Image', Image);
    end
end