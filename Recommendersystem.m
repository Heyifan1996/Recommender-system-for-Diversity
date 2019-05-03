clc;clear;
%A Coverage-Based Approach to Recommendation Diversity On Similarity Graph Diversity On Similarity Graph
% load DealMovielens1m;
% A=rating;
% clear rating
% [traindata,testdata,usernumber,itemnumber]=Dividedata1(A,0.5);%按比例把评分时间靠后的作为测试集
load YaHoo50User;
R1=zeros(usernumber,itemnumber);%评分矩阵
for i=1:length(traindata)
    R1(traindata(i,1),traindata(i,2))=traindata(i,3);
end
UIlist=cell(usernumber,1);%产生用户购买的产品id列表
for i=1:length(traindata)
    UIlist{traindata(i,1)}=[UIlist{traindata(i,1)},traindata(i,2)];
end
% ItemSim=zeros(itemnumber);%计算产品相似度，余弦相似度
% for i=1:itemnumber
%     tic;
%     for j=1:itemnumber
%         ItemSim(i,j)=(R(:,i)'*R(:,j))/(norm(R(:,j))*norm(R(:,i)));
% %         ItemSim(i,j)=((R(:,i)-mean_score)'*(R(:,j)-mean_score))/(norm(R(:,j)-mean_score)*norm(R(:,i)-mean_score));%皮尔森相关系数
%     end
%     toc;
% end
load MMRdata ItemSim;
tic;%基于覆盖率的推荐
 RecSUB =SUB(R1,ItemSim,UIlist,usernumber,itemnumber,10);
toc;
