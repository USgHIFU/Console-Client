function [XDiv YDiv ZDiv DeltaS XYZVectorArrayCor] = ArrayDiv(ArrayR,RadiusNum,AngleNum);
%**************************************************************************
%**************************************************************************   
%*  ʱ��:2006��6��14��                                                     *   
%*  ����Ŀ��:��ÿ����Ԫ��ɢ��,��ÿ��΢Ԫ�ĵ������XYZ����                     *
%*  ��������:ArrayR��ʾ��Ԫ�뾶                                             *
%*  ����,RadiusNum��ʾ�뾶�ķ�����AngleNum��ʾ�Ƕȵķ���                     *                    
%*  �������:DeltaS��ʾ��Ԫÿ��΢Ԫ�����                                    * 
%*  ����, XDiv��YDiv��ZDiv�ֱ��ʾ��Ԫ����ϵ��Ԫ��΢Ԫ��XYZ����               *
%*  XYZVectorArrayCor��ʾ��Ԫ����ϵ��ÿ����ԪRadiusNum*AngleNum��΢Ԫ        *
%*  ����,��XYZ����,�����е�һ�д���X����,�ڶ��д���Y����,�����д���Z����       *
%**************************************************************************
%**************************************************************************
   
%XDiv,YDiv,ZDivΪRadiusNum*AngleNumά
RadiusDiv = ArrayR / RadiusNum - ArrayR / RadiusNum / 2 : ArrayR / RadiusNum : ArrayR - ArrayR / RadiusNum / 2;
AngleDiv = 2*pi / AngleNum : 2*pi / AngleNum : 2 * pi
XDiv = RadiusDiv' * cos(AngleDiv);
YDiv = RadiusDiv' * sin(AngleDiv);
ZDiv = zeros(RadiusNum,AngleNum);

DeltaS = 0;
MTemp = 0;
%��DeltaS��һ����Ԫ����ΪRadiusNum*AngleNum��΢Ԫ��DeltaSΪ΢Ԫ�����
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

%��XDiv,YDiv,ZDiv���������,�����ں���������任����������
XShape = reshape(XDiv,1,RadiusNum*AngleNum);
YShape = reshape(YDiv,1,RadiusNum*AngleNum);
ZShape = reshape(ZDiv,1,RadiusNum*AngleNum);
XYZVectorArrayCor = [XShape;YShape;ZShape];