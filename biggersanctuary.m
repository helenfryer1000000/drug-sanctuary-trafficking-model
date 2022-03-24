clear all
clc

timepreX=-1500;  %(with ARV1)
timepre=-5;
time0=0;
time1=35;   %(3->4 also with mixing therapy) 

global beta z0 z1 u0 u1 alpha delta tau0 tau1 B deltastar

% X0   X1   Y0   Y1
% Z(1) Z(2) Z(3) Z(4)

R0=6;

%Ganusov parameters
B=1.4*10^8;
alpha=0.01;% %%new estimate 
delta=1;
beta=R0*alpha*delta/B;
u0=0.5;
u1=1-u0;
deltastar=-0.5;

z0start=0.6;
z0end=0.6;

z1start=0.97;
z1end=0.97;

z0=z0start;
z1=z1start;

tau0=0.5;
tau1=tau0*u0/u1;

Zstartpre=[B*u0/alpha,B*u1/alpha,32.139,8.7*10^5];

[TTpre,ZZpre] = ode45(@dZZ,[timepreX,timepre], Zstartpre); %this for matlab 6.5

sizeZZpre=size(ZZpre);
Zstart1=ZZpre(sizeZZpre(1),:);

[TT1,ZZ1] = ode45(@dZZ,[timepre,time0], Zstart1); %this for matlab 6.5

sizeZZ1=size(ZZ1);
Zstart2=ZZ1(sizeZZ1(1),:);

z0=z0end;
z1=z1end;

% deltastar=-0.5; tau0=5*0.5;     %fig1
% deltastar=-0.5; tau0=3.5*0.5;   %fig2
% deltastar=0;    tau0=0.5;       %fig3
deltastar=0;    tau0=3.5*0.5;     %fig4

tau1=tau0*u0/u1;

[TT2,ZZ2] = ode45(@dZZ,[time0,time1], Zstart2); %this for matlab 6.5

TT=[TT1;TT2];
ZZ=[ZZ1;ZZ2];

% figure(1)
% hold on; area([-4.99,0,0,-4.99],[0.01, 0.01,6.49,6.49],'facecolor','g')
hold on; plot(TT,log10([ZZ(:,3),ZZ(:,4)]),'Linewidth',1.5);  %% Total in sanct
% xlabel('Time on trafficking therapy (days)')
% ylabel('Log_1_0(number of infected CD4+ T-cells)')
axis([-5,time1,0,12])
%gtext({'ART';'ART & trafficking therapy (\kappa=5)'},'Fontsize',12)
%gtext({'ART';'ART & trafficking therapy (\kappa=3.5)'},'Fontsize',12)
%gtext({'ART';'ART & immune therapy (\delta_0=1)'},'Fontsize',12)
% gtext({'ART';'ART, trafficking therapy (\kappa=3.5) & immune therapy (\delta_0=1)'},'Fontsize',12)
