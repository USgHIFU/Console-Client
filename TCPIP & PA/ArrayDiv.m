function [XDiv YDiv ZDiv DeltaS XYZVectorArrayCor] = ArrayDiv(ArrayR,RadiusNum,AngleNum);
%**************************************************************************
%**************************************************************************   
%*  时间:2006年6月14日                                                     *   
%*  函数目的:将每个阵元离散化,求每个微元的的面积和XYZ坐标                     *
%*  函数输入:ArrayR表示阵元半径                                             *
%*  续上,RadiusNum表示半径的份数，AngleNum表示角度的份数                     *                    
%*  函数输出:DeltaS表示阵元每份微元的面积                                    * 
%*  续上, XDiv，YDiv，ZDiv分别表示阵元坐标系阵元上微元的XYZ坐标               *
%*  XYZVectorArrayCor表示阵元坐标系中每个阵元RadiusNum*AngleNum个微元        *
%*  续上,的XYZ坐标,矩阵中第一行代表X坐标,第二行代表Y向量,第三行代表Z向量       *
%**************************************************************************
%**************************************************************************
   
%XDiv,YDiv,ZDiv为RadiusNum*AngleNum维
RadiusDiv = ArrayR / RadiusNum - ArrayR / RadiusNum / 2 : ArrayR / RadiusNum : ArrayR - ArrayR / RadiusNum / 2;
AngleDiv = 2*pi / AngleNum : 2*pi / AngleNum : 2 * pi
XDiv = RadiusDiv' * cos(AngleDiv);
YDiv = RadiusDiv' * sin(AngleDiv);
ZDiv = zeros(RadiusNum,AngleNum);

DeltaS = 0;
MTemp = 0;
%求DeltaS，一个阵元被分为RadiusNum*AngleNum个微元，DeltaS为微元的面积
for AngleTemp = 2*pi / AngleNum : 2*pi  / AngleNum : 2 * pi;                            
   MTemp = MTemp + 1;
   NTemp = 0;
   for RadiusTemp = ArrayR / RadiusNum : ArrayR / RadiusNum : ArrayR;
      NTemp = NTemp + 1;
      if NTemp == 1;
         DeltaS(NTemp,MTemp) = RadiusTemp.^2 * pi / AngleNum;
      else
         DeltaS(NTemp,MTemp)= (RadiusTemp.^2 * pi / AngleNum ) - sum(DeltaS(:,MTemp));
      end
   end
end

%将XDiv,YDiv,ZDiv变成行向量,有利于后续的坐标变换的批量处理
XShape = reshape(XDiv,1,RadiusNum*AngleNum);
YShape = reshape(YDiv,1,RadiusNum*AngleNum);
ZShape = reshape(ZDiv,1,RadiusNum*AngleNum);
XYZVectorArrayCor = [XShape;YShape;ZShape];