%   TODO:   position changed to string type
%--------------------------------------------------------------------------
%   Change the valid directive into the position, return the value of
%   position, or else return null.
%--------------------------------------------------------------------------
%   AUTHOR: JI Xiang
%   Last modified by JI Xiang APR-10-2015
%--------------------------------------------------------------------------

function Pos = directive2position(Directive)

POS_STEP = 2.5;
DIRECTIVE_MAX = hex2dec('0F');
DIRECTIVE_MIN = hex2dec('59');
BOUND_LEFT = hex2dec('62');
BOUND_RIGHT = hex2dec('6E');
DIRECTIVE_ODEGREE = hex2dec('10');

if validateDirective(Directive)
    if (Directive >= DIRECTIVE_MAX) && (Directive <= DIRECTIVE_MIN)
        Pos = (Directive - DIRECTIVE_ODEGREE) * POS_STEP;
    elseif Directive == BOUND_LEFT
        Pos = -5;
    elseif Directive == BOUND_RIGHT
        Pos = 185;
    end
else
    Pos = [];
end