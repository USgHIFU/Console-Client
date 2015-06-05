%--------------------------------------------------------------------------
%   Ensure that the directive of the position is valid, and return 1 if it
%   is valid, or else return 0.
%--------------------------------------------------------------------------
%   AUTHOR: JI Xiang
%   Last modified by JI Xiang APR-07-2015
%--------------------------------------------------------------------------

function result = validateDirective(directive)

MIN_DIRECTIVE = hex2dec('0F');
MAX_DIRECTIVE = hex2dec('59');
LEFT_BOUND = hex2dec('62');
RIGHT_BOUND = hex2dec('6E');

if directive >= MIN_DIRECTIVE && directive <= MAX_DIRECTIVE
    result = 1;
elseif directive == LEFT_BOUND || directive == RIGHT_BOUND
    result = 1;
else
    result = 0;
end
