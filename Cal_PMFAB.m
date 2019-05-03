function [ result ] = Cal_PMFAB( tempI,alpha,beta,S,temppro,tempP_R,V )
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
 if isempty(S)
     result=tempP_R(tempI);
 else
     tempS=[S,tempI];
     score=sum(tempP_R(tempS));
     PartA=zeros(length(temppro));
     for i=1:length(temppro)
     parta=zeros(length(S));
     for j=1:length(S)
         parta(j)=V(temppro(i),:)*V(S(j),:)';
     end
     PartA=max(parta);
     end
     PartB=0;
     for i=1:length(tempS)
         for j=i+1:length(tempS)
             PartB=PartB+norm(V(tempS(i),:)-V(tempS(j),:));
         end
     end
     
     result=score+alpha*sum(PartA)+beta*PartB;
 end
 


end

