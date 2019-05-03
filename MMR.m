clc;clear;
load MovieLen_user_percent;
%先进行ItemBased 预测
mean_score=mean(traindata(:,end));%平均分若不存在相似产品则信息缺失，取平均值，且可用于求解皮尔森相关系数
R=zeros(usernumber,itemnumber);%评分矩阵
for i=1:length(traindata)
    R(traindata(i,1),traindata(i,2))=traindata(i,3);
end
% tic;
% ItemSim=zeros(itemnumber);%计算产品相似度，余弦相似度
% for i=1:itemnumber
%     for j=1:itemnumber
%         ItemSim(i,j)=(R(:,i)'*R(:,j))/(norm(R(:,j))*norm(R(:,i)));
% %         ItemSim(i,j)=((R(:,i)-mean_score)'*(R(:,j)-mean_score))/(norm(R(:,j)-mean_score)*norm(R(:,i)-mean_score));%皮尔森相关系数
%     end
% end
% toc;
User_item=cell(usernumber,1);%每个用户对应的产品id与产品评分
for i=1:length(traindata)
    User_item{traindata(i,1)}=[User_item{traindata(i,1)};traindata(i,2),traindata(i,3)];
end
load ItemSimUserPercent;
% tic;
% P_R=zeros(usernumber,itemnumber);
% for i=1:usernumber
%     tic;
%     Scorelist=zeros(itemnumber,1);%当前用户的预测评分
%     temp=User_item{i};%该用户购买篮中的产品id与评分
%     if isempty(temp)%如无用户评分，设置为平均分
%             Scorelist=mean_score;
%     else
%     for j=1:itemnumber
%         
%        if  sum(ItemSim(temp(:,1),j))==0
%             Scorelist(j)=mean_score;
%         else  
%         Simlist=ItemSim(temp(:,1),j);%产品j与其它产品的相似度
%         Simlist=Simlist/sum(Simlist);%相似度归一化
%         Scorelist(j)=sum(Simlist.*temp(:,2));%与评分相乘得到最终产品预测评分
%         end
%     end
%     Scorelist(temp(:,1))=temp(:,2);
%     P_R(i,:)=Scorelist';
%     end 
%     toc;
% end
% toc;
% save UserperP_R P_R
load UserperP_R P_R;
tic;
UPRec_MMR01=RECMMR( 0.1,10,User_item,P_R,ItemSim,usernumber,2000 );
UPRec_MMR01metric=evaluate(UPRec_MMR01);
toc;
tic;
UPRec_MMR05=RECMMR( 0.5,10,User_item,P_R,ItemSim,usernumber,2000 );
UPRec_MMR05metric=evaluate(UPRec_MMR05);
toc;
tic;
UPRec_MMR08=RECMMR( 0.8,10,User_item,P_R,ItemSim,usernumber,2000 );
UPRec_MMR08metric=evaluate(UPRec_MMR08);
toc;