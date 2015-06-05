function Success = sendCommand(Tcpip,Cmd)

Success = false;

fprintf(Tcpip,Cmd);
StrWithTerminator = sprintf('%s\n',Cmd);
pause(25);
StrReceived = fscanf(Tcpip);
if strcmp(StrWithTerminator,StrReceived)
    Success = true;
end

flushinput(Tcpip);
flushoutput(Tcpip);