clear;
close all;

[xtrain, ytrain]=readxy('ballist',2,2);
[xtest, ytest]=readxy('balltest',2,2);

units_list = [4:2:20];
units=6;

for units = units_list
    
data=xtrain;
vqinit;
singlewinner=1;
emiterb;

figure(1), axis([0 1 0 1]);

Phi=calcPhi(xtrain,m,var);

d1=ytrain(:,1);
d2=ytrain(:,2);
dtest1=ytest(:,1);
dtest2=ytest(:,2);

w1=Phi\d1;
w2=Phi\d2;

y1=Phi*w1;
y2=Phi*w2;

Phitest=calcPhi(xtest,m,var);
ytest1=Phitest*w1;
ytest2=Phitest*w2;

    
figure
subplot(2,2,1)
xyplot(d1,y1,'train1')
subplot(2,2,2)
xyplot(d2,y2,'train2')
subplot(2,2,3)
xyplot(dtest1,ytest1,'test1')
subplot(2,2,4)
xyplot(dtest2,ytest2,'test2')

end
