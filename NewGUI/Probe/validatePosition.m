%--------------------------------------------------------------------------
%   Ensure that the input of position is in the range of 0 to 180 degree,
%   or else return null.
%--------------------------------------------------------------------------
%   AUTHOR: JI Xiang
%   Last modified by JI Xiang APR-07-2015
%--------------------------------------------------------------------------

function result = validatePosition(pos)

pos = str2double(pos);

MIN_POSITION = 0;
MAX_POSITION = 180;
POSITION_STEP = 2.5;

if pos >= MIN_POSITION && pos <= MAX_POSITION
    result = fix(pos / POSITION_STEP) * POSITION_STEP;
else
    result = [];
end