clc;clear;
load MovieLen_user_percent;
%�Ƚ���ItemBased Ԥ��
mean_score=mean(traindata(:,end));%ƽ���������������Ʋ�Ʒ����Ϣȱʧ��ȡƽ��ֵ���ҿ��������Ƥ��ɭ���ϵ��
R=zeros(usernumber,itemnumber);%���־���
for i=1:length(traindata)
    R(traindata(i,1),traindata(i,2))=traindata(i,3);
end
% tic;
% ItemSim=zeros(itemnumber);%�����Ʒ���ƶȣ��������ƶ�
% for i=1:itemnumber
%     for j=1:itemnumber
%         ItemSim(i,j)=(R(:,i)'*R(:,j))/(norm(R(:,j))*norm(R(:,i)));
% %         ItemSim(i,j)=((R(:,i)-mean_score)'*(R(:,j)-mean_score))/(norm(R(:,j)-mean_score)*norm(R(:,i)-mean_score));%Ƥ��ɭ���ϵ��
%     end
% end
% toc;
User_item=cell(usernumber,1);%ÿ���û���Ӧ�Ĳ�Ʒid���Ʒ����
for i=1:length(traindata)
    User_item{traindata(i,1)}=[User_item{traindata(i,1)};traindata(i,2),traindata(i,3)];
end
load ItemSimUserPercent;
% tic;
% P_R=zeros(usernumber,itemnumber);
% for i=1:usernumber
%     tic;
%     Scorelist=zeros(itemnumber,1);%��ǰ�û���Ԥ������
%     temp=User_item{i};%���û��������еĲ�Ʒid������
%     if isempty(temp)%�����û����֣�����Ϊƽ����
%             Scorelist=mean_score;
%     else
%     for j=1:itemnumber
%         
%        if  sum(ItemSim(temp(:,1),j))==0
%             Scorelist(j)=mean_score;
%         else  
%         Simlist=ItemSim(temp(:,1),j);%��Ʒj��������Ʒ�����ƶ�
%         Simlist=Simlist/sum(Simlist);%���ƶȹ�һ��
%         Scorelist(j)=sum(Simlist.*temp(:,2));%��������˵õ����ղ�ƷԤ������
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