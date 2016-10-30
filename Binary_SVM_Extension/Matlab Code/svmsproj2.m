load 'C:\Users\Rajagopaalan\Desktop\oneone\bussaab\Xtrain.dat'
save
load 'C:\Users\Rajagopaalan\Desktop\oneone\bussaab\Ytrain.dat'
save

load 'C:\Users\Rajagopaalan\Desktop\fsl\Xtest.dat'
save

load 'C:\Users\Rajagopaalan\Desktop\fsl\Ytest.dat'
save



filename= 'C:\Users\Rajagopaalan\Documents\MATLAB\matlab.mat ';
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
bias=z(Xfeatures+1);

%result = Xtest*transpose(z) ;
z1=z(1:Xfeatures);
z2=z(Xfeatures+1:Xsamples+Xfeatures);
z3=sum(z2)/200 ;

resultbus=(Xtest*z1)+z3 ;
resultbus=(Xtest*z1)+bias ;
resultsize=size(resultbus,1);

for i=1:resultsize
    if(resultbus(i,1) > 0)
        labelresultsizebus(i,1)=1;
    else
        labelresultsizebus(i,1)=-1;
    end
end

for i=1:resultsize
    if(resultbus(i,1) > 0)
        labelresultsizebus(i,1)=1;
    else
        labelresultsizebus(i,1)=-1;
    end
end

for i=1:resultsize
    if(labelresultsizebus(i,1)==1)
       % labelresultsizebus(i,1)=1;
       bussaabl(i,:)=1;
    else
        bussaabl(i,:)=2;
    end
end



for i=1:resultsize
    if(  labelresultsizebus(i,1) == Ytest(i,1))
       labelaccbus(i,1)=1;
    else
        labelaccbus(i,1)=0;
    end
end
noofones=0;
for q=1:size(labelaccbus)
if(labelaccbus(q,1)==1)
    noofones=noofones+1;
end
end

predictionbussaab=noofones/resultsize ;


load 'C:\Users\Rajagopaalan\Desktop\oneone\busvan\Xtrain.dat'
save
load 'C:\Users\Rajagopaalan\Desktop\oneone\busvan\Ytrain.dat'
save


filename= 'C:\Users\Rajagopaalan\Documents\MATLAB\matlab.mat ';
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
Abusvan(i,:) = -[Ytrain(i,:)*Xtrain(i,:),Ytrain(i,:),zeros(1,i-1),1,zeros(1,Xsamples-i)] ;
gbusvan(i,:) = -1;
end


for i=1:Xsamples
Abusvan(Xsamples+i,:) = -[zeros(1,Xfeatures+1),zeros(1,i-1),1,zeros(1,Xsamples-i)] ;
gbusvan(Xsamples+i,:)=0;
end
 
A=full(A);

z=quadprog(Q,c,Abusvan,gbusvan);
%bias=0.336;
bias=z(Xfeatures+1);

%result = Xtest*transpose(z) ;
z1=z(1:Xfeatures);
z2=z(Xfeatures+1:Xsamples+Xfeatures);
z3=sum(z2)/200 ;

resultbus=(Xtest*z1)+z3 ;
resultbus=(Xtest*z1)+bias ;
resultsize=size(resultbus,1);

for i=1:resultsize
    if(resultbus(i,1) > 0)
        labelresultsizebus(i,1)=1;
    else
        labelresultsizebus(i,1)=-1;
    end
end

for i=1:resultsize
    if(resultbus(i,1) > 0)
        labelresultsizebus(i,1)=1;
    else
        labelresultsizebus(i,1)=-1;
    end
end

for i=1:resultsize
    if(labelresultsizebus(i,1)==1)
       % labelresultsizebus(i,1)=1;
       busvanl(i,:)=1;
    else
        busvanl(i,:)=4;
    end
end



for i=1:resultsize
    if(  labelresultsizebus(i,1) == Ytest(i,1))
       labelaccbus(i,1)=1;
    else
        labelaccbus(i,1)=0;
    end
end
noofones=0;
for q=1:size(labelaccbus)
if(labelaccbus(q,1)==1)
    noofones=noofones+1;
end
end

predictionbusvan=noofones/resultsize ;



load 'C:\Users\Rajagopaalan\Desktop\oneone\busopel\Xtrain.dat'
save
load 'C:\Users\Rajagopaalan\Desktop\oneone\busopel\Ytrain.dat'
save


filename= 'C:\Users\Rajagopaalan\Documents\MATLAB\matlab.mat ';
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
Abusopel(i,:) = -[Ytrain(i,:)*Xtrain(i,:),Ytrain(i,:),zeros(1,i-1),1,zeros(1,Xsamples-i)] ;
gbusopel(i,:) = -1;
end


for i=1:Xsamples
Abusopel(Xsamples+i,:) = -[zeros(1,Xfeatures+1),zeros(1,i-1),1,zeros(1,Xsamples-i)] ;
gbusopel(Xsamples+i,:)=0;
end
 
A=full(A);

z=quadprog(Q,c,Abusopel,gbusopel);
%bias=0.336;
bias=z(Xfeatures+1);

%result = Xtest*transpose(z) ;
z1=z(1:Xfeatures);
z2=z(Xfeatures+1:Xsamples+Xfeatures);
z3=sum(z2)/200 ;

resultbus=(Xtest*z1)+z3 ;
resultbus=(Xtest*z1)+bias ;
resultsize=size(resultbus,1);

for i=1:resultsize
    if(resultbus(i,1) > 0)
        labelresultsizebus(i,1)=1;
    else
        labelresultsizebus(i,1)=-1;
    end
end

for i=1:resultsize
    if(resultbus(i,1) > 0)
        labelresultsizebus(i,1)=1;
    else
        labelresultsizebus(i,1)=-1;
    end
end

for i=1:resultsize
    if(labelresultsizebus(i,1)==1)
       % labelresultsizebus(i,1)=1;
       busopell(i,:)=1;
    else
        busopell(i,:)=3;
    end
end



for i=1:resultsize
    if(  labelresultsizebus(i,1) == Ytest(i,1))
       labelaccbus(i,1)=1;
    else
        labelaccbus(i,1)=0;
    end
end
noofones=0;
for q=1:size(labelaccbus)
if(labelaccbus(q,1)==1)
    noofones=noofones+1;
end
end

predictionbusopel=noofones/resultsize ;




load 'C:\Users\Rajagopaalan\Desktop\oneone\opelsaab\Xtrain.dat'
save
load 'C:\Users\Rajagopaalan\Desktop\oneone\opelsaab\Ytrain.dat'
save


filename= 'C:\Users\Rajagopaalan\Documents\MATLAB\matlab.mat ';
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
Aopelsaab(i,:) = -[Ytrain(i,:)*Xtrain(i,:),Ytrain(i,:),zeros(1,i-1),1,zeros(1,Xsamples-i)] ;
gopelsaab(i,:) = -1;
end


for i=1:Xsamples
Aopelsaab(Xsamples+i,:) = -[zeros(1,Xfeatures+1),zeros(1,i-1),1,zeros(1,Xsamples-i)] ;
gopelsaab(Xsamples+i,:)=0;
end
 
A=full(A);

z=quadprog(Q,c,Aopelsaab,gopelsaab);
%bias=0.336;
bias=z(Xfeatures+1);

%result = Xtest*transpose(z) ;
z1=z(1:Xfeatures);
z2=z(Xfeatures+1:Xsamples+Xfeatures);
z3=sum(z2)/200 ;

resultbus=(Xtest*z1)+z3 ;
resultbus=(Xtest*z1)+bias ;
resultsize=size(resultbus,1);

for i=1:resultsize
    if(resultbus(i,1) > 0)
        labelresultsizebus(i,1)=1;
    else
        labelresultsizebus(i,1)=-1;
    end
end

for i=1:resultsize
    if(resultbus(i,1) > 0)
        labelresultsizebus(i,1)=1;
    else
        labelresultsizebus(i,1)=-1;
    end
end

for i=1:resultsize
    if(labelresultsizebus(i,1)==1)
       % labelresultsizebus(i,1)=1;
       opelsaabl(i,:)=2;
    else
        opelsaabl(i,:)=3;
    end
end



for i=1:resultsize
    if(  labelresultsizebus(i,1) == Ytest(i,1))
       labelaccbus(i,1)=1;
    else
        labelaccbus(i,1)=0;
    end
end
noofones=0;
for q=1:size(labelaccbus)
if(labelaccbus(q,1)==1)
    noofones=noofones+1;
end
end

predictionopelsaab=noofones/resultsize ;




load 'C:\Users\Rajagopaalan\Desktop\oneone\opelvan\Xtrain.dat'
save
load 'C:\Users\Rajagopaalan\Desktop\oneone\opelvan\Ytrain.dat'
save


filename= 'C:\Users\Rajagopaalan\Documents\MATLAB\matlab.mat ';
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
Aopelvan(i,:) = -[Ytrain(i,:)*Xtrain(i,:),Ytrain(i,:),zeros(1,i-1),1,zeros(1,Xsamples-i)] ;
gopelvan(i,:) = -1;
end


for i=1:Xsamples
Aopelvan(Xsamples+i,:) = -[zeros(1,Xfeatures+1),zeros(1,i-1),1,zeros(1,Xsamples-i)] ;
gopelvan(Xsamples+i,:)=0;
end
 
A=full(A);

z=quadprog(Q,c,Aopelvan,gopelvan);
%bias=0.336;
bias=z(Xfeatures+1);

%result = Xtest*transpose(z) ;
z1=z(1:Xfeatures);
z2=z(Xfeatures+1:Xsamples+Xfeatures);
z3=sum(z2)/200 ;

resultbus=(Xtest*z1)+z3 ;
resultbus=(Xtest*z1)+bias ;
resultsize=size(resultbus,1);

for i=1:resultsize
    if(resultbus(i,1) > 0)
        labelresultsizebus(i,1)=1;
    else
        labelresultsizebus(i,1)=-1;
    end
end

for i=1:resultsize
    if(resultbus(i,1) > 0)
        labelresultsizebus(i,1)=1;
    else
        labelresultsizebus(i,1)=-1;
    end
end

for i=1:resultsize
    if(labelresultsizebus(i,1)==1)
       % labelresultsizebus(i,1)=1;
       opelvanl(i,:)=3;
    else
        opelvanl(i,:)=4;
    end
end



for i=1:resultsize
    if(  labelresultsizebus(i,1) == Ytest(i,1))
       labelaccbus(i,1)=1;
    else
        labelaccbus(i,1)=0;
    end
end
noofones=0;
for q=1:size(labelaccbus)
if(labelaccbus(q,1)==1)
    noofones=noofones+1;
end
end

predictionopelvan=noofones/resultsize ;




load 'C:\Users\Rajagopaalan\Desktop\oneone\saabvan\Xtrain.dat'
save
load 'C:\Users\Rajagopaalan\Desktop\oneone\saabvan\Ytrain.dat'
save


filename= 'C:\Users\Rajagopaalan\Documents\MATLAB\matlab.mat ';
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
Asaabvan(i,:) = -[Ytrain(i,:)*Xtrain(i,:),Ytrain(i,:),zeros(1,i-1),1,zeros(1,Xsamples-i)] ;
gsaabvan(i,:) = -1;
end


for i=1:Xsamples
Asaabvan(Xsamples+i,:) = -[zeros(1,Xfeatures+1),zeros(1,i-1),1,zeros(1,Xsamples-i)] ;
gsaabvan(Xsamples+i,:)=0;
end
 
A=full(A);

z=quadprog(Q,c,Asaabvan,gsaabvan);
%bias=0.336;
bias=z(Xfeatures+1);

%result = Xtest*transpose(z) ;
z1=z(1:Xfeatures);
z2=z(Xfeatures+1:Xsamples+Xfeatures);
z3=sum(z2)/200 ;

resultbus=(Xtest*z1)+z3 ;
resultbus=(Xtest*z1)+bias ;
resultsize=size(resultbus,1);

for i=1:resultsize
    if(resultbus(i,1) > 0)
        labelresultsizebus(i,1)=1;
    else
        labelresultsizebus(i,1)=-1;
    end
end

for i=1:resultsize
    if(resultbus(i,1) > 0)
        labelresultsizebus(i,1)=1;
    else
        labelresultsizebus(i,1)=-1;
    end
end

for i=1:resultsize
    if(labelresultsizebus(i,1)==1)
       % labelresultsizebus(i,1)=1;
       saabvanl(i,:)=2;
    else
        saabvanl(i,:)=4;
    end
end



for i=1:resultsize
    if(  labelresultsizebus(i,1) == Ytest(i,1))
       labelaccbus(i,1)=1;
    else
        labelaccbus(i,1)=0;
    end
end
noofones=0;
for q=1:size(labelaccbus)
if(labelaccbus(q,1)==1)
    noofones=noofones+1;
end
end

predictionsaabvan=noofones/resultsize ;


finalcombinedmat=[busopell,bussaabl,busvanl,saabvanl,opelsaabl,opelvanl];


for fi=1:resultsize
    %  finalclassopt2(fi,:)=max(finalcombinedmat(fi,:));
    
    cnt3=0;
cnt2=0;
cnt1=0; 
cnt4=0;
  for fq=1:6
       if(finalcombinedmat(fi,fq)==1)
           cnt1=cnt1+1;
           print cnt1;
       end
        if(finalcombinedmat(fi,fq)==2)
           cnt2=cnt2+1;
            print cnt2;
        end
        if(finalcombinedmat(fi,fq)==3)
           cnt3=cnt3+1;
            print cnt3;
        end
        if(finalcombinedmat(fi,fq)==4)
           cnt4=cnt4+1;
            print cnt4;
       end
  end
  maxnoftimes=[cnt1,cnt2,cnt3,cnt4];
  maxlabel=max(maxnoftimes);
  if(maxlabel==cnt4)
       finalclasscomp(fi,:)=4;
  end
   if(maxlabel==cnt3)
       finalclasscomp(fi,:)=3;
   end
   if(maxlabel==cnt2)
       finalclasscomp(fi,:)=2;
   end
   if(maxlabel==cnt1)
       finalclasscomp(fi,:)=1;
  end
 
    
end


load 'C:\Users\Rajagopaalan\Desktop\fsl\test1234\Ytestcumulative.dat'
save
accuracyfinalcounter2=0;
for ta=1:resultsize
    if(Ytestcumulative(ta,1)~=      finalclasscomp(ta,1))
        accuracyfinalcounter2=  accuracyfinalcounter2+1;
    end
end

   accustimateopt2=resultsize -  accuracyfinalcounter2;
    Cumulativefinalaccuracyopt2=  accustimateopt2/resultsize;
            






