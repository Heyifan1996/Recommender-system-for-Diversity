clc;clear;
%A Coverage-Based Approach to Recommendation Diversity On Similarity Graph Diversity On Similarity Graph
% load DealMovielens1m;
% A=rating;
% clear rating
% [traindata,testdata,usernumber,itemnumber]=Dividedata1(A,0.5);%������������ʱ�俿�����Ϊ���Լ�
load YaHoo50User;
R1=zeros(usernumber,itemnumber);%���־���
for i=1:length(traindata)
    R1(traindata(i,1),traindata(i,2))=traindata(i,3);
end
UIlist=cell(usernumber,1);%�����û�����Ĳ�Ʒid�б�
for i=1:length(traindata)
    UIlist{traindata(i,1)}=[UIlist{traindata(i,1)},traindata(i,2)];
end
% ItemSim=zeros(itemnumber);%�����Ʒ���ƶȣ��������ƶ�
% for i=1:itemnumber
%     tic;
%     for j=1:itemnumber
%         ItemSim(i,j)=(R(:,i)'*R(:,j))/(norm(R(:,j))*norm(R(:,i)));
% %         ItemSim(i,j)=((R(:,i)-mean_score)'*(R(:,j)-mean_score))/(norm(R(:,j)-mean_score)*norm(R(:,i)-mean_score));%Ƥ��ɭ���ϵ��
%     end
%     toc;
% end
load MMRdata ItemSim;
tic;%���ڸ����ʵ��Ƽ�
 RecSUB =SUB(R1,ItemSim,UIlist,usernumber,itemnumber,10);
toc;
