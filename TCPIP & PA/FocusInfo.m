% 2012/09/19
% Alpha Version
% ���뽹��λ����Ϣ��������Χ

XFocus = PosXFocus;
YFocus = PosYFocus;
ZFocus = 0.14-PosZFocus;
I = 3.33e5;
P = sqrt(2 * Rou * c * I);
save('FocusInfo','XFocus','YFocus','ZFocus','NumFocus');