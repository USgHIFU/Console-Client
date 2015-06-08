%--------------------------------------------------------------------------
%   Receive the command, and do something according to the commands.
%--------------------------------------------------------------------------
%   AUTHOR: JI Xiang
%   Last modified by JI Xiang MAY-17-2015
%--------------------------------------------------------------------------

function Success = receiveCommand(hFigure,Str)

Cmd = getCommand;

switch Str
    case Cmd.Start
        disp('start');
        startSonication(hFigure);
        Success = true;
    case Cmd.Stop
        disp('stop');
        stopSonication(hFigure);
        Success = true;
    case Cmd.Pause
        
    case Cmd.Resume
    otherwise
        Success = false;
end