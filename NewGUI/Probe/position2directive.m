%--------------------------------------------------------------------------
%   Change the position into directive if the position is valid, and return
%   the directive if it is valid, or else return null.
%--------------------------------------------------------------------------
%   AUTHOR: JI Xiang
%   Last modified by JI Xiang APR-07-2015
%--------------------------------------------------------------------------

function Directive = position2directive(Pos)

POS_STEP = 2.5;
DIRECTIVE_0DEGREE = hex2dec('10');

Value = validatePosition(Pos);

if ~isempty(Value)
    Directive = Value / POS_STEP + DIRECTIVE_0DEGREE;
else
    Directive = [];
end