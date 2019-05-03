function [ traindata,testdata,usernumber,itemnumber] =Dividedata1( A,percentage )
%按用户按比例划分数据集
usernumber=max(A(:,1));
itemnumber=max(A(:,2));
A=sortrows(A,4);
C=cell(usernumber,1);
for i=1:length(A)
    C{A(i,1)}=[C{A(i,1)};A(i,1:4)];
end
len=zeros(usernumber,1);
for i=1:usernumber
    len(i)=length(C{i});
end
% testlen=floor(len*percentage)+1;
testlen=round(len*percentage);
trainlen=len-testlen;
testdata=zeros(sum(testlen),4);
traindata=zeros(sum(trainlen),4);
testlocal=1;
trainlocal=1;
for i=1:usernumber
    temp=C{i};
    temptrain=temp(1:trainlen(i),:);
    temptest=temp(trainlen(i)+1:end,:);
    testdata(testlocal:testlocal+size(temptest,1)-1,:)=temptest;
    traindata(trainlocal:trainlocal+size(temptrain,1)-1,:)=temptrain;
    testlocal=testlocal+size(temptest,1);
    trainlocal=trainlocal+size(temptrain,1);
end
testdata=testdata(:,1:3);
traindata=traindata(:,1:3);
end

