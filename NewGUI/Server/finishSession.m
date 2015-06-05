function Success = finishSession(Tcpip)

Success = false;
SESSION_TERMINATOR = 'FINISHING...';
Success4send = sendString(Tcpip,SESSION_TERMINATOR);
Success = Success4send;