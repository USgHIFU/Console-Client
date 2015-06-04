% 2012/09/19
% Alpha Version
% AngleT为变换后的相位

function [Voltage, AngleT] = PhaseInfo(NumFocus,PosXFocus,PosYFocus,PosZFocus)

format long;
TissueInfo;
ArrayInfo;
FocusInfo;
[XDiv YDiv ZDiv DeltaS XYZVectorArrayCor] = ArrayDiv(ElementR,NumRadius,NumAngle);
[H XArray YArray ZArray] = ForwardMatrix(XYZVectorArrayCor,DeltaS);
[U AngleT] = PsuedoInverse(H,P,Rou,c);
Voltage = abs(U);