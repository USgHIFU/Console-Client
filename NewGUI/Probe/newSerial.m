%--------------------------------------------------------------------------
%   1. Find the exist serial ports and then delete them;
%   2. Create the serial object specified by input 'Port';
%   3. Set the parameters;
%   4. Open the created serial object.
%--------------------------------------------------------------------------
%   AUTHOR: JI Xiang
%   Last modified by JI Xiang MAR-28-2015.
%--------------------------------------------------------------------------

function Serial = newSerial(Port)

Serial = instrfind('Type','serial','Port',Port);
deleteSerial(Serial);

Serial = serial(Port);
Parameter = getSerialParam;

Serial.BAUD = Parameter.BAUD;
Serial.DataBits = Parameter.DataBits;
Serial.StopBits = Parameter.StopBits;
Serial.Parity = Parameter.Parity;
Serial.ReadAsyncMode = Parameter.ReadAsyncMode;
Serial.Timeout = Parameter.Timeout;
Serial.InputBufferSize = Parameter.InputBufferSize;

try
    fopen(Serial);
catch Exception
    handleExceptionFOPEN(Serial,Exception);
end