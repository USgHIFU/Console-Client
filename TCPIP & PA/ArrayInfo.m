% 2012/09/19
% Alpha Version
% ������������

%���������ʰ뾶����λ��m
SphericalR = 0.140;

%Բ����Ԫ�뾶����λ��m
ElementR = 0.005;

%�뾶���ַ���
NumRadius = 20;

%�ǶȻ��ַ���
NumAngle = 20;

%ÿ����Ԫ����
NumRingElement = [5 6 8 9] * 4;

%ÿ����Z��нǣ���λ��rad
AngleZ = [15.40 19.75 24.20 28.80]/180*pi;

%ÿ������Ԫ��X��нǣ���λ��rad
AngleFirstX = pi ./  NumRingElement;

%��Ԫ����
NumRing = 4;

%�������Ԫ����
NumElement = sum(NumRingElement);

%ÿ����Ԫ��X�ᡢZ��нǣ���λ��rad
AngleXElement = [];
AngleZElement = [];
for i = 1:NumRing
    AngleXElement = [AngleXElement AngleFirstX(i):2*AngleFirstX(i):2*AngleFirstX(i)*(NumRingElement(i) - 1) + AngleFirstX(i)];
    AngleZElement = [AngleZElement AngleZ(i)*ones(1,NumRingElement(i))];
end