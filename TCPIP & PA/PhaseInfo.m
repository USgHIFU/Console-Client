% 2012/09/19
% Alpha Version
% AngleTΪ�任�����λ

function [Voltage, AngleT] = PhaseInfo(NumFocus,PosXFocus,PosYFocus,PosZFocus)

format long;
TissueInfo;
ArrayInfo;
FocusInfo;
[XDiv YDiv ZDiv DeltaS XYZVectorArrayCor] = ArrayDiv(ElementR,NumRadius,NumAngle);
[H XArray YArray ZArray] = ForwardMatrix(XYZVectorArrayCor,DeltaS);
[U AngleT] = PsuedoInverse(H,P,Rou,c);
Voltage = abs(U);