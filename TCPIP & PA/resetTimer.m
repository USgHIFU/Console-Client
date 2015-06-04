function resetTimer(Timer)

if strcmp(get(Timer.on,'Running'),'on')
    stop(Timer.on);
elseif strcmp(get(Timer.off,'Running'),'on')
    stop(Timer.off);
elseif strcmp(get(Timer.cooling,'Running'),'on')
    stop(Timer.cooling);
end