function [ result ] = Cal_MMR( tempI,lambda,S,P,ItemSim )
%计算推荐列表的MMR值
result=0;
for i=1:length(P)%公式前半部分计算与用户总则相似度
    tempitem=P(i,1);
    tempvalue=P(i,2);
    result=result+lambda*(ItemSim(tempI,tempitem)*tempvalue);
end
if ~isempty(S)%减去内部最大相似度
w=zeros(length(S),1);
for i=1:length(w)
    w(i)=ItemSim(S(i),tempI);
end
result=result-(1-lambda)*max(w);
end


end

