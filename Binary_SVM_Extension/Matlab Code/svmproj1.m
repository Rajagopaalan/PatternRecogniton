load 'C:\Users\Rajagopaalan\Desktop\fsl\Xtrain.dat'
save
load 'C:\Users\Rajagopaalan\Desktop\fsl\Xtest.dat'
save
load 'C:\Users\Rajagopaalan\Desktop\fsl\Ytrain.dat'
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
        labelresultsize(i,1)=1;
    else
        labelresultsize(i,1)=-1;
    end
end

for i=1:resultsize
    if(resultbus(i,1) > 0)
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

predictionbus=noofones/resultsize ;



load 'C:\Users\Rajagopaalan\Desktop\fsl\van\Ytrain.dat'
save
load 'C:\Users\Rajagopaalan\Desktop\fsl\van\Ytest.dat'
save

filename= 'C:\Users\Rajagopaalan\Documents\MATLAB\matlab.mat ';
for ivan=1:Xsamples
Avan(ivan,:) = -[Ytrain(ivan,:)*Xtrain(ivan,:),Ytrain(ivan,:),zeros(1,ivan-1),1,zeros(1,Xsamples-ivan)] ;
gvan(ivan,:) = -1;
end


for ivan=1:Xsamples
Avan(Xsamples+ivan,:) = -[zeros(1,Xfeatures+1),zeros(1,ivan-1),1,zeros(1,Xsamples-ivan)] ;
gvan(Xsamples+ivan,:)=0;
end
 
Avan=full(Avan);

z=quadprog(Q,c,Avan,gvan);
%bias=0.336;
bias=z(Xfeatures+1);

%result = Xtest*transpose(z) ;
z1=z(1:Xfeatures);
z2=z(Xfeatures+1:Xsamples+Xfeatures);
z3=sum(z2)/200 ;

resultvan=(Xtest*z1)+z3 ;
resultvan=(Xtest*z1)+bias ;
resultsize=size(resultvan,1);

for i=1:resultsize
    if(resultvan(i,1) > 0)
        labelresultsize(i,1)=1;
    else
        labelresultsize(i,1)=-1;
    end
end

for i=1:resultsize
    if(resultvan(i,1) > 0)
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

predictionvan=noofones/resultsize ;





%bias=sum(z,



%bias=sum(z,


load 'C:\Users\Rajagopaalan\Desktop\fsl\saab\Ytrain.dat'
save
load 'C:\Users\Rajagopaalan\Desktop\fsl\saab\Ytest.dat'
save

filename= 'C:\Users\Rajagopaalan\Documents\MATLAB\matlab.mat ';
for isaab=1:Xsamples
Asaab(isaab,:) = -[Ytrain(isaab,:)*Xtrain(isaab,:),Ytrain(isaab,:),zeros(1,isaab-1),1,zeros(1,Xsamples-isaab)] ;
gsaab(isaab,:) = -1;
end


for isaab=1:Xsamples
Asaab(Xsamples+isaab,:) = -[zeros(1,Xfeatures+1),zeros(1,isaab-1),1,zeros(1,Xsamples-isaab)] ;
gsaab(Xsamples+isaab,:)=0;
end
 
Asaab=full(Asaab);

z=quadprog(Q,c,Asaab,gsaab);
%bias=0.336;
bias=z(Xfeatures+1);

%result = Xtest*transpose(z) ;
z1=z(1:Xfeatures);
z2=z(Xfeatures+1:Xsamples+Xfeatures);
z3=sum(z2)/200 ;

resultsaab=(Xtest*z1)+z3 ;
resultsaab=(Xtest*z1)+bias ;
resultsize=size(resultsaab,1);

for i=1:resultsize
    if(resultsaab(i,1) > 0)
        labelresultsize(i,1)=1;
    else
        labelresultsize(i,1)=-1;
    end
end

for i=1:resultsize
    if(resultsaab(i,1) > 0)
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

predictionsaab=noofones/resultsize ;





%bias=sum(z,


load 'C:\Users\Rajagopaalan\Desktop\fsl\opel\Ytrain.dat'
save
load 'C:\Users\Rajagopaalan\Desktop\fsl\opel\Ytest.dat'
save

filename= 'C:\Users\Rajagopaalan\Documents\MATLAB\matlab.mat ';
for iopel=1:Xsamples
Aopel(iopel,:) = -[Ytrain(iopel,:)*Xtrain(iopel,:),Ytrain(iopel,:),zeros(1,iopel-1),1,zeros(1,Xsamples-iopel)] ;
gopel(iopel,:) = -1;
end


for iopel=1:Xsamples
Aopel(Xsamples+iopel,:) = -[zeros(1,Xfeatures+1),zeros(1,iopel-1),1,zeros(1,Xsamples-iopel)] ;
gopel(Xsamples+iopel,:)=0;
end
 
Aopel=full(Aopel);

z=quadprog(Q,c,Aopel,gopel);
%bias=0.336;
bias=z(Xfeatures+1);

%result = Xtest*transpose(z) ;
z1=z(1:Xfeatures);
z2=z(Xfeatures+1:Xsamples+Xfeatures);
z3=sum(z2)/200 ;

resultopel=(Xtest*z1)+z3 ;
resultopel=(Xtest*z1)+bias ;
resultsize=size(resultopel,1);

for i=1:resultsize
    if(resultopel(i,1) > 0)
        labelresultsize(i,1)=1;
    else
        labelresultsize(i,1)=-1;
    end
end

for i=1:resultsize
    if(resultopel(i,1) > 0)
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

predictionopel=noofones/resultsize ;

finalmatrix=[resultbus,resultopel,resultvan,resultsaab];

for w=1:resultsize
  
       maxvector(w,:)= max(finalmatrix(w,:));
                maxvalue =  max(finalmatrix(w,:));
                  if(resultbus(w,1)==maxvalue)
                        finalemat=1;
                  end
                
                      if(resultsaab(w,1)==maxvalue)
                      finalemat=2;
                      end
                      if(resultopel(w,1)==maxvalue)
                      finalemat=3;
                      end
                      if(resultvan(w,1)==maxvalue)
                      finalemat=4;
                      end
                     
                      finalematrixno(w,:)=  finalemat;
             %   [I,J] = ind2sub(4,  maxvector);
                
   %    y  = ismember(max(finalmatrix(w,:);,finalmatrix);
       %maxvectorlabel
    
    
end

load 'C:\Users\Rajagopaalan\Desktop\fsl\test1234\Ytestcumulative.dat'
save
accuracyfinalcounter=0;
for t=1:resultsize
    if(Ytestcumulative(t,1)~=   finalematrixno(t,1))
        accuracyfinalcounter=  accuracyfinalcounter+1;
    end
end


   accustimate=resultsize -  accuracyfinalcounter;
    Cumulativefinalaccuracy=  accustimate/resultsize;


