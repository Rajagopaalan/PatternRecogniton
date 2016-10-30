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
        labelresultsizevan(i,1)=1;
    else
        labelresultsizevan(i,1)=-1;
    end
end

for i=1:resultsize
    if(resultvan(i,1) > 0)
        labelresultsizevan(i,1)=1;
    else
        labelresultsizevan(i,1)=-1;
    end
end

for i=1:resultsize
    if(  labelresultsizevan(i,1) == Ytest(i,1))
       labelaccvan(i,1)=1;
    else
        labelaccvan(i,1)=0;
    end
end
noofones=0;
for q=1:size(labelaccvan)
if(labelaccvan(q,1)==1)
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
        labelresultsizesaab(i,1)=1;
    else
        labelresultsizesaab(i,1)=-1;
    end
end

for i=1:resultsize
    if(resultsaab(i,1) > 0)
        labelresultsizesaab(i,1)=1;
    else
        labelresultsizesaab(i,1)=-1;
    end
end

for i=1:resultsize
    if(  labelresultsizesaab(i,1) == Ytest(i,1))
       labelaccsaab(i,1)=1;
    else
        labelaccsaab(i,1)=0;
    end
end
noofones=0;
for q=1:size(labelaccsaab)
if(labelaccsaab(q,1)==1)
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
        labelresultsizeopel(i,1)=1;
    else
        labelresultsizeopel(i,1)=-1;
    end
end

for i=1:resultsize
    if(resultopel(i,1) > 0)
        labelresultsizeopel(i,1)=1;
    else
        labelresultsizeopel(i,1)=-1;
    end
end

for i=1:resultsize
    if(  labelresultsizeopel(i,1) == Ytest(i,1))
       labelaccopel(i,1)=1;
    else
        labelaccopel(i,1)=0;
    end
end
noofones=0;
for q=1:size(labelaccopel)
if(labelaccopel(q,1)==1)
    noofones=noofones+1;
end
end

predictionopel=noofones/resultsize ;



finalmatrix=[resultbus,resultopel,resultvan,resultsaab];

load 'C:\Users\Rajagopaalan\Desktop\fsl\bussaab\Ytrain.dat'
save
load 'C:\Users\Rajagopaalan\Desktop\fsl\bussaab\Ytest.dat'
save

filename= 'C:\Users\Rajagopaalan\Documents\MATLAB\matlab.mat ';
for ibussaab=1:Xsamples
Abussaab(ibussaab,:) = -[Ytrain(ibussaab,:)*Xtrain(ibussaab,:),Ytrain(ibussaab,:),zeros(1,ibussaab-1),1,zeros(1,Xsamples-ibussaab)] ;
gbussaab(ibussaab,:) = -1;
end


for ibussaab=1:Xsamples
Abussaab(Xsamples+ibussaab,:) = -[zeros(1,Xfeatures+1),zeros(1,ibussaab-1),1,zeros(1,Xsamples-ibussaab)] ;
gbussaab(Xsamples+ibussaab,:)=0;
end
 
Abussaab=full(Abussaab);

z=quadprog(Q,c,Abussaab,gbussaab);
%bias=0.336;
bias=z(Xfeatures+1);

%result = Xtest*transpose(z) ;
z1=z(1:Xfeatures);
z2=z(Xfeatures+1:Xsamples+Xfeatures);
z3=sum(z2)/200 ;

resultbussaab=(Xtest*z1)+z3 ;
resultbussaab=(Xtest*z1)+bias ;
resultsize=size(resultbussaab,1);

for i=1:resultsize
    if(resultbussaab(i,1) > 0)
        labelresultsizebussaab(i,1)=1;
    else
        labelresultsizebussaab(i,1)=-1;
    end
end

for i=1:resultsize
    if(resultbussaab(i,1) > 0)
        labelresultsizebussaab(i,1)=1;
    else
        labelresultsizebussaab(i,1)=-1;
    end
end

for i=1:resultsize
    if(  labelresultsizebussaab(i,1) == Ytest(i,1))
       labelaccbussaab(i,1)=1;
    else
        labelaccbussaab(i,1)=0;
    end
end
noofones=0;
for q=1:size(labelaccbussaab)
if(labelaccbussaab(q,1)==1)
    noofones=noofones+1;
end
end

predictionbussaab=noofones/resultsize ;


load 'C:\Users\Rajagopaalan\Desktop\fsl\busopel\Ytrain.dat'
save
load 'C:\Users\Rajagopaalan\Desktop\fsl\busopel\Ytest.dat'
save

filename= 'C:\Users\Rajagopaalan\Documents\MATLAB\matlab.mat ';
for ibusopel=1:Xsamples
Abusopel(ibusopel,:) = -[Ytrain(ibusopel,:)*Xtrain(ibusopel,:),Ytrain(ibusopel,:),zeros(1,ibusopel-1),1,zeros(1,Xsamples-ibusopel)] ;
gbusopel(ibusopel,:) = -1;
end


for ibusopel=1:Xsamples
Abusopel(Xsamples+ibusopel,:) = -[zeros(1,Xfeatures+1),zeros(1,ibusopel-1),1,zeros(1,Xsamples-ibusopel)] ;
gbusopel(Xsamples+ibusopel,:)=0;
end
 
Abusopel=full(Abusopel);

z=quadprog(Q,c,Abusopel,gbusopel);
%bias=0.336;
bias=z(Xfeatures+1);

%result = Xtest*transpose(z) ;
z1=z(1:Xfeatures);
z2=z(Xfeatures+1:Xsamples+Xfeatures);
z3=sum(z2)/200 ;

resultbusopel=(Xtest*z1)+z3 ;
resultbusopel=(Xtest*z1)+bias ;
resultsize=size(resultbusopel,1);

for i=1:resultsize
    if(resultbusopel(i,1) > 0)
        labelresultsizebusopel(i,1)=1;
    else
        labelresultsizebusopel(i,1)=-1;
    end
end

for i=1:resultsize
    if(resultbusopel(i,1) > 0)
        labelresultsizebusopel(i,1)=1;
    else
        labelresultsizebusopel(i,1)=-1;
    end
end

for i=1:resultsize
    if(  labelresultsizebusopel(i,1) == Ytest(i,1))
       labelaccbusopel(i,1)=1;
    else
        labelaccbusopel(i,1)=0;
    end
end
noofones=0;
for q=1:size(labelaccbusopel)
if(labelaccbusopel(q,1)==1)
    noofones=noofones+1;
end
end

predictionbusopel=noofones/resultsize ;



load 'C:\Users\Rajagopaalan\Desktop\fsl\busvan\Ytrain.dat'
save
load 'C:\Users\Rajagopaalan\Desktop\fsl\busvan\Ytest.dat'
save

filename= 'C:\Users\Rajagopaalan\Documents\MATLAB\matlab.mat ';
for ibusvan=1:Xsamples
Abusvan(ibusvan,:) = -[Ytrain(ibusvan,:)*Xtrain(ibusvan,:),Ytrain(ibusvan,:),zeros(1,ibusvan-1),1,zeros(1,Xsamples-ibusvan)] ;
gbusvan(ibusvan,:) = -1;
end


for ibusvan=1:Xsamples
Abusvan(Xsamples+ibusvan,:) = -[zeros(1,Xfeatures+1),zeros(1,ibusvan-1),1,zeros(1,Xsamples-ibusvan)] ;
gbusvan(Xsamples+ibusvan,:)=0;
end
 
Abusvan=full(Abusvan);

z=quadprog(Q,c,Abusvan,gbusvan);
%bias=0.336;
bias=z(Xfeatures+1);

%result = Xtest*transpose(z) ;
z1=z(1:Xfeatures);
z2=z(Xfeatures+1:Xsamples+Xfeatures);
z3=sum(z2)/200 ;

resultbusvan=(Xtest*z1)+z3 ;
resultbusvan=(Xtest*z1)+bias ;
resultsize=size(resultbusvan,1);

for i=1:resultsize
    if(resultbusvan(i,1) > 0)
        labelresultsizebusvan(i,1)=1;
    else
        labelresultsizebusvan(i,1)=-1;
    end
end

for i=1:resultsize
    if(resultbusvan(i,1) > 0)
        labelresultsizebusvan(i,1)=1;
    else
        labelresultsizebusvan(i,1)=-1;
    end
end

for i=1:resultsize
    if(  labelresultsizebusvan(i,1) == Ytest(i,1))
       labelaccbusvan(i,1)=1;
    else
        labelaccbusvan(i,1)=0;
    end
end
noofones=0;
for q=1:size(labelaccbusvan)
if(labelaccbusvan(q,1)==1)
    noofones=noofones+1;
end
end

predictionbusvan=noofones/resultsize ;


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
            

outputcode=[labelresultsizebus,labelresultsizesaab,labelresultsizeopel,labelresultsizevan,labelresultsizebussaab,labelresultsizebusopel,labelresultsizebusvan] ;
C=[1  -1  -1  -1  1  1  1 ; -1  1  -1  -1  1 -1 -1 ; -1 -1   1  -1 -1  1 -1 ; -1 -1  -1   1 -1 -1  1];

%C=[1  -1  -1  -1  1  -1  -1 ; -1  1  -1  -1  1 -1 1 ; -1 -1   1  -1 -1  1 -1 ; -1 -1  -1   -1 -1 1  1];

for ip=1:resultsize
    distbus=0;
distsaab=0;
distopel=0;
distvan=0;

    for op=1:7
        
   distbus=distbus+(outputcode(ip,op)- C(1,op))*(outputcode(ip,op)- C(1,op)); 
   distsaab=distsaab+(outputcode(ip,op)- C(2,op))*(outputcode(ip,op)- C(2,op)); 
   distopel=distopel+(outputcode(ip,op)- C(3,op))*(outputcode(ip,op)- C(3,op)); 
   distvan=distvan+(outputcode(ip,op)- C(4,op))*(outputcode(ip,op)- C(4,op)); 
   
minmat=[distbus,distsaab,distopel,distvan];
minval=min(minmat);
if minval==distbus
    minlabel=1;
    
end
if minval==distopel;
    minlabel=3;
    
end
if minval==distvan
    minlabel=4;
    
end
 if minval==distsaab
    minlabel=2;
    
end      
       
      minvalmatr(ip,:)=minlabel; 
    
    end
    
    
    
  % mindist= min([distbus(1,1),distsaab(1,1),distopel(1,1),distvan(1,1)]);
  % mindist=min
  
  % distmatrix(ip,:)=mindist;
end


accuracyfinalcounter2=0;
for ta=1:resultsize
    if(Ytestcumulative(ta,1)~=   minvalmatr(ta,1))
        accuracyfinalcounter2=  accuracyfinalcounter2+1;
    end
end

   accustimateopt3=resultsize -  accuracyfinalcounter2;
    Cumulativefinalaccuracyopt3=  accustimateopt3/resultsize;
            



