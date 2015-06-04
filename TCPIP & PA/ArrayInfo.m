% 2012/09/19
% Alpha Version
% 输入相控阵参数

%凹球面曲率半径，单位：m
SphericalR = 0.140;

%圆形阵元半径，单位：m
ElementR = 0.005;

%半径划分份数
NumRadius = 20;

%角度划分份数
NumAngle = 20;

%每环阵元数量
NumRingElement = [5 6 8 9] * 4;

%每环与Z轴夹角，单位：rad
AngleZ = [15.40 19.75 24.20 28.80]/180*pi;

%每环首阵元与X轴夹角，单位：rad
AngleFirstX = pi ./  NumRingElement;

%阵元环数
NumRing = 4;

%相控阵阵元数量
NumElement = sum(NumRingElement);

%每个阵元与X轴、Z轴夹角，单位：rad
AngleXElement = [];
AngleZElement = [];
for i = 1:NumRing
    AngleXElement = [AngleXElement AngleFirstX(i):2*AngleFirstX(i):2*AngleFirstX(i)*(NumRingElement(i) - 1) + AngleFirstX(i)];
    AngleZElement = [AngleZElement AngleZ(i)*ones(1,NumRingElement(i))];
end