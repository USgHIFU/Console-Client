%   Author: JI Xiang
%   Date:   10/29/2013
%   Create digital output control associated with DI/O card and open it.

function DO = InitializeDigitalOutput

ControlName = 'DAQDO.DAQDOCtrl.1';
DO = actxcontrol(ControlName);

DeviceNumber = 0;
DO.DeviceNumber = DeviceNumber;
strFuncOpenDevice = 'OpenDevice';
DO.invoke(strFuncOpenDevice);
