% 2012/09/19
% Alpha Version
% ������֯����


%��֯�ܶȣ���λ��kg/m^3
Rou = 1138;

%����Ƶ�ʣ���λ��Hz
Freq = 1.360;
USFreq = Freq * 1e6;

%��֯���٣���λ��m/s
c = 1569;

%˥��ϵ������λ��Np/m
Atten = 9;
Alpha = Atten * Freq;

%����
K = 2 * pi * USFreq / c;