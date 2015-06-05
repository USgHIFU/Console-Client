%--------------------------------------------------------------------------
%   Given the next position to rotate, count the number of steps from
%   previous position to the next position, and return the number.
%   If the next position is invalid, return the number of null.
%--------------------------------------------------------------------------
%   AUTHOR: JI Xiang
%   Last modified by JI Xiang APR-05-2015
%--------------------------------------------------------------------------

function StepCount = CountRotatingStep(PrevPos,NextPos)

StepCount = [];
POS_STEP = 2.5;
NextPos = validatePosition(NextPos);
PrevPos = validatePosition(PrevPos);

if ~isempty(NextPos)
    StepCount = abs(NextPos - PrevPos) / POS_STEP;
end