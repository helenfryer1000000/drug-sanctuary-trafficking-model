clear all
clc

d1=1;
d0=1;
R0=6;
z1=0.97;

z0=0:0.001:1;
z00=0.1:0.001:1;
z000=0.43:0.001:1;
u0vec=[0.001,0.01,0.05,0.1,0.12,0.15,0.25];

for i=1:5
    u0=u0vec(i);
    numer=d1*(d1*R0*(1-z0)-d0)*(R0*(1-z1)-1);
    denom=u0/(1-u0)*(d1*R0*(1-z0)-d0)+d1*(R0*(1-z1)-1);
    kappatau0=numer./denom;
    hold on; plot(z0,kappatau0,'k')
end

for i=6
    u0=u0vec(i);
    numer=d1*(d1*R0*(1-z00)-d0)*(R0*(1-z1)-1);
    denom=u0/(1-u0)*(d1*R0*(1-z00)-d0)+d1*(R0*(1-z1)-1);
    kappatau0=numer./denom;
    hold on; plot(z00,kappatau0,'k')
end
for i=1:7
    u0=u0vec(i);
    numer=d1*(d1*R0*(1-z000)-d0)*(R0*(1-z1)-1);
    denom=u0/(1-u0)*(d1*R0*(1-z000)-d0)+d1*(R0*(1-z1)-1);
    kappatau0=numer./denom;
    hold on; plot(z000,kappatau0,'k')
end

gtext({'u_0=0.001';'u_0=0.01';'u_0=0.05';'u_0=0.1';'u_0=0.12';'u_0=0.15';'u_0=0.25'})

axis([0,1,0,35])
xlabel('Effectiveness of ART in the drug sancturies (z_0)')
ylabel('Rate cells traffic out of sanctuaries (\kappa\tau_0)')