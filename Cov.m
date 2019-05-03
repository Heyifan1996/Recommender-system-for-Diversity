function [ value ] = Cov(gamma,userid,S,P,W,R)
%º∆À„∏≤∏«¬ ÷µ
value=0;
for i=1:length(P)
    tempscore=R(userid,P(i));
    temp=0;
    for j=1:length(S)
        temp=temp+W(P(i),S(j))^(1/gamma);
    end
    value=value+tempscore*temp^gamma; 
end
end

