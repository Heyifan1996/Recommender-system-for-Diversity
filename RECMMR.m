function [ Rec_MMR] =RECMMR( lambda,K,User_item,P_R,ItemSim,usernumber,candidate )
%MMR
Rec_MMR=cell(usernumber,1);
for i=1:usernumber
    tic;
    temppro=User_item{i};
    tempP_R=P_R(i,:);%Ԥ������
    tempP_R(temppro(:,1))=0;%�޳����ѹ����Ʒ
    [~,index]=sort(tempP_R,'descend');%ͨ�����������ѡ
    X=index(1:candidate);%��ѡ��
    k=1;
    S=[];
    while k<=K
        TEMP=zeros(length(X),1);
        for j=1:length(TEMP)
            TEMP(j)=Cal_MMR( X(j),lambda,S,temppro,ItemSim );%�˴�Ҳ��ʹ��Cal_PMFAB
        end 
        [~,tempindex]=max(TEMP);
        rec=X(tempindex);
        X(tempindex)=[];
        S=[S,rec];
        k=k+1;
    end
    Rec_MMR{i}=S;
    toc;
end



end

