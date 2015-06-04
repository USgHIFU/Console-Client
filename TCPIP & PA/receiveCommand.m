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
        StartTimer = timer('TimerFcn',{@StartTimerFcn,hFigure},...
                           'ExecutionMode','singleShot');
        start(StartTimer);
        Success = true;
    case Cmd.Stop
        disp('stop');
        StopTimer = timer('TimerFcn',{@StopTimerFcn,hFigure},...
                          'ExecutionMode','singleShot');
        start(StopTimer);
        Success = true;
    case Cmd.Pause
        
    case Cmd.Resume
    otherwise
        Success = false;
end