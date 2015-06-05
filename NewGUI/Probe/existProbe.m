%--------------------------------------------------------------------------
%   Ensure the object of probe has been created. And return 1 if probe
%   exists, or else return 0.
%--------------------------------------------------------------------------
%   AUTHOR: JI Xiang
%   Last modified by JI Xiang APR-05-2015
%--------------------------------------------------------------------------

function IsExist = existProbe(hFigure)

IsExist = false;

if isempty(getappdata(hFigure,'probe'))
    Probe = newProbe;
    if isempty(Probe)
        return
    else
        setappdata(hFigure,'probe',Probe);
        IsExist = true;
    end
else
    IsExist = true;
end