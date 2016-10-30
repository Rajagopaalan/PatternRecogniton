filename= 'C:\Users\Rajagopaalan\Documents\MATLAB\HeartDataSet.mat ';
S=load(filename);
Xtrain= full(Xtrain);
Xtest=full(Xtest);
Xsamples = size(Xtrain,1) ;
Xfeatures = size(Xtrain,2) ;
I = eye(Xfeatures);
O1=zeros(Xfeatures,Xsamples+1) ;
O2=zeros(Xsamples+1,Xfeatures) ;

O3=zeros(Xsamples+1,Xsamples+1) ;
Q=[I,O1 ; O2, O3];

one=ones(1,Xsamples);
zero=zeros(1,Xsamples);
c=[zeros(Xfeatures+1,1);ones(Xsamples,1)];




for i=1:Xsamples
A(i,:) = -[Ytrain(i,:)*Xtrain(i,:),Ytrain(i,:),zeros(1,i-1),1,zeros(1,Xsamples-i)] ;
g(i,:) = -1;
end


for i=1:Xsamples
A(Xsamples+i,:) = -[zeros(1,Xfeatures+1),zeros(1,i-1),1,zeros(1,Xsamples-i)] ;
g(Xsamples+i,:)=0;
end
 
A=full(A);

z=quadprog(Q,c,A,g);
%bias=0.336;
bias=z(14,1);

%result = Xtest*transpose(z) ;
z1=z(1:Xfeatures);
z2=z(Xfeatures+1:Xsamples+Xfeatures);
z3=sum(z2)/200 ;

result=(Xtest*z1)+z3 ;
resultsize=size(result,1);

for i=1:resultsize
    if(result(i,1) > 0)
        labelresultsize(i,1)=1;
    else
        labelresultsize(i,1)=-1;
    end
end

for i=1:resultsize
    if(result(i,1) > 0)
        labelresultsize(i,1)=1;
    else
        labelresultsize(i,1)=-1;
    end
end

for i=1:resultsize
    if(  labelresultsize(i,1) == Ytest(i,1))
       labelacc(i,1)=1;
    else
        labelacc(i,1)=0;
    end
end
noofones=0;
for q=1:size(labelacc)
if(labelacc(q,1)==1)
    noofones=noofones+1;
end
end

accu=noofones/resultsize ;

