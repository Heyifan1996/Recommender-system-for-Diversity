function [ result ] = Cal_MMR( tempI,lambda,S,P,ItemSim )
%�����Ƽ��б��MMRֵ
result=0;
for i=1:length(P)%��ʽǰ�벿�ּ������û��������ƶ�
    tempitem=P(i,1);
    tempvalue=P(i,2);
    result=result+lambda*(ItemSim(tempI,tempitem)*tempvalue);
end
if ~isempty(S)%��ȥ�ڲ�������ƶ�
w=zeros(length(S),1);
for i=1:length(w)
    w(i)=ItemSim(S(i),tempI);
end
result=result-(1-lambda)*max(w);
end


end

