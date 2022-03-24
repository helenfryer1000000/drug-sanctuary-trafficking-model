clear all
clc

timepreX=-1500;  %(with ARV1)
timepre=-50;
time0=0;
time1=400;   %(3->4 also with mixing therapy) 

global beta z0 z1 u0 u1 alpha delta tau0 tau1 B

% X0   X0t  X1   Y0   Y0t  Y1
% Z(1) Z(2) Z(3) Z(4) Z(5) Z(6)

R0=8;

%%total uninfected lymphocytes  

dattotaltcells=4.6*10^11;
% dattotinfcelluntreated=450*0.87*10^5.5; %%+cells per gram in LN
%dattotinfcelluntreated=450*0.87*1; %%+cells per gram in LN

dattotinfcelluntreated=70*10^5.5; %%+cells per gram in LN
% dattotinfcelluntreated=70*1; %%+cells per gram in LN

B=1.4*10^8;
alpha=0.01;% %%new estimate 
delta=1;
beta=R0*alpha*delta/B;
u0=3.69*10^(-5);
u1=1-u0;


% B=0.75*10^8;
% alpha=0.0035;
% delta=1;
% beta=R0*alpha*delta/B;
% u0=3.69*10^(-5);
% u1=1-u0;

% z0start=0;
% z0end=0;
% 
% z1start=0;
% z1end=0;

z0start=0.6;
z0end=0.6;

z1start=0.97;
z1end=0.97;

z0=z0start;
z1=z1start;

tau0=1/3;
tau1=tau0*u0/u1;

Zstartpre=[B*u0/alpha,B*u1/alpha,32.139,8.7*10^5];
% Zstartpre=[B*u0/alpha,B*u1/alpha,0,0];

[TTpre,ZZpre] = ode45(@dZZ,[timepreX,timepre], Zstartpre); %this for matlab 6.5

sizeZZpre=size(ZZpre);
Zstart1=ZZpre(sizeZZpre(1),:);

[TT1,ZZ1] = ode45(@dZZ,[timepre,time0], Zstart1); %this for matlab 6.5

sizeZZ1=size(ZZ1);
Zstart2=ZZ1(sizeZZ1(1),:);

z0=z0end;
z1=z1end;

tau0=8/3;
tau0=6/3;
tau0=3/3;
tau0=0.5/3;
tau1=tau0*u0/u1;

[TT2,ZZ2] = ode45(@dZZ,[time0,time1], Zstart2); %this for matlab 6.5

TT=[TT1;TT2];
ZZ=[ZZ1;ZZ2];

figure(1)
hold on; plot(TT,log10(ZZ(:,3)),'r')  %% Inf in sanct
hold on; plot(TT,log10(ZZ(:,4)),'k')  %% Inf in main
legend('sanct', 'main')
xlabel('Time on mixing therapy (days)')
ylabel('log_1_0(Infected cells)')
axis([-5,30,0,6.5])

% figure(2)
% hold on; plot(TT,log10(dattotaltcells)+0*TT,'c')
% hold on; plot(TT,log10(sum(ZZ,2)),'b')  %% Total cells in body
% xlabel('Time (days)')
% ylabel('log_1_0(Number of cells)')
% % % axis([-5,30,3,6.5])
% 
% hold on; plot(TT,log10(ZZ(:,3)+ZZ(:,4)),'g')  %% Total infected cells in body
% hold on; plot(TT,log10(dattotinfcelluntreated)+0*TT,'c')
% axis([-50,400,4,10])

