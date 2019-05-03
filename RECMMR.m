function [ Rec_MMR] =RECMMR( lambda,K,User_item,P_R,ItemSim,usernumber,candidate )
%MMR
Rec_MMR=cell(usernumber,1);
for i=1:usernumber
    tic;
    temppro=User_item{i};
    tempP_R=P_R(i,:);%预测评分
    tempP_R(temppro(:,1))=0;%剔除掉已购买产品
    [~,index]=sort(tempP_R,'descend');%通过评分排序节选
    X=index(1:candidate);%候选集
    k=1;
    S=[];
    while k<=K
        TEMP=zeros(length(X),1);
        for j=1:length(TEMP)
            TEMP(j)=Cal_MMR( X(j),lambda,S,temppro,ItemSim );%此处也可使用Cal_PMFAB
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

