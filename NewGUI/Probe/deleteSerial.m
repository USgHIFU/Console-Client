%--------------------------------------------------------------------------
%   Delete the object of serial
%--------------------------------------------------------------------------
%   AUTHOR: JI Xiang
%   Last modified by JI Xiang APR-05-2015
%--------------------------------------------------------------------------   

function deleteSerial(serial)

if ~isempty(serial)
    fclose(serial);
    delete(serial);
end