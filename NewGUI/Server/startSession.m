%--------------------------------------------------------------------------
%   Start the session, and return the status.
%--------------------------------------------------------------------------
%   AUTHOR: JI Xiang
%   Last modified by JI Xiang MAY-17-2015
%--------------------------------------------------------------------------

function Success = startSession(Tcpip,SessionType)

Success = false;
SESSION_HEADER = 'CONNECTING...';
Success4Header = sendString(Tcpip,SESSION_HEADER);
pause(0.5);
Success4SessionType = sendString(Tcpip,SessionType);
pause(0.5);
if Success4Header && Success4SessionType    
    Success = true;
end