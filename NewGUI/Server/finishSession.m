function Success = finishSession(Tcpip)

Success = false;
SESSION_TERMINATOR = 'FINISHING...';
Success = sendString(Tcpip,SESSION_TERMINATOR);