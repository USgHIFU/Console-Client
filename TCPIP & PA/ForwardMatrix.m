function [H XArray YArray ZArray] = ForwardMatrix(XYZVectorArrayCor,DeltaS);

load FocusInfo;
ArrayInfo;
TissueInfo;

for iElement = 1:NumElement
    XGlobal = SphericalR * sin(AngleZElement(iElement)) * cos(AngleXElement(iElement));
    YGlobal = SphericalR * sin(AngleZElement(iElement)) * sin(AngleXElement(iElement));
    ZGlobal = SphericalR * cos(AngleZElement(iElement));
    XYZVectorGlobal = TranferCord([XGlobal;YGlobal;ZGlobal],XYZVectorArrayCor);
    
    XArray(iElement,:) = XYZVectorGlobal(1,:);
    YArray(iElement,:) = XYZVectorGlobal(2,:);
    ZArray(iElement,:) = XYZVectorGlobal(3,:);
    
    r = sqrt((XArray(iElement,:) - XFocus).^2 + (YArray(iElement,:) - YFocus).^2 + (ZArray(iElement,:) - ZFocus).^2 );
	Heds = exp( -(j * K + Alpha ) .* r) .* reshape(DeltaS,1,size(XArray,2)) ./ r;
	Hes(iElement) = sum(Heds,2);
end

H = j * Rou * USFreq * Hes;