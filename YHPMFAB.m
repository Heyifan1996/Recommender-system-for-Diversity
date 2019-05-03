clc;clear;
load YaHoo50User;
load UVYaHoo1;
ItemSim=zeros(itemnumber);%计算相似度
tic;
for i=1:itemnumber
    tic;
    for j=i+1:itemnumber
        ItemSim(i,j)=(V(i,:)*V(j,:)')/(norm(V(i,:))*norm(V(j,:)));
    end
    toc;
end
ItemSim=ItemSim+ItemSim'+eye(itemnumber);
toc;
tic;
P_R=zeros(usernumber,itemnumber);
for i=1:usernumber
    for j=1:itemnumber
        P_R(i,j)=U(i,:)*V(j,:)';
    end
end
toc;
save YHItemSimP_R ItemSim P_R;
load YHItemSimP_R;
User_item=cell(usernumber,1);%每个用户对应的产品id与产品评分
for i=1:length(traindata)
    User_item{traindata(i,1)}=[User_item{traindata(i,1)};traindata(i,2),traindata(i,3)];
end
tic;
YHPMFAB=RECMMR( 0.3,1.5,30,P_R,User_item,usernumber,V );
toc;

