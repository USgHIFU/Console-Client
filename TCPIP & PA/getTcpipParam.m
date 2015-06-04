function Param = getTcpipParam

Param = struct('Address',                   '0.0.0.0',...
               'Port',                      5500,...
               'NetworkRole',               'server',...
               'ReadAsyncMode',             'continuous',...
               'InputBufferSize',           2000,...
               'OutputBufferSize',          2000,...
               'Timeout',                   10,...
               'BytesAvailableFcnMode',     'terminator');
                     