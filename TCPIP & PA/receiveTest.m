%   use case for test
%   start the timer, and start all the power amplifiers in the timer fcn.

function Success = receiveTest

Success = false;
disp('start');
StartTimer = timer('StartFcn',@TestTimerFcn,...
                   'TimerFcn',@Test2TimerFcn,...
                   'ExecutionMode','singleShot');
start(StartTimer);
Success = true;