clear all
clc

figure;
hold on; plot([0,1-1/12],[5.5,0])
hold on; plot([0,1-1/6],[5,0])
axis([0,1,0,6])
gtext('sustainable ongoing replication')
gtext('ongoing replication is not sustainable')
gtext('\delta_0=1')
gtext('\delta_0=0.5')
xlabel('Effective drug concentration in drug sanctuaries (z_0)')
ylabel('Rate cells traffic out of sanctuaries (\kappa\tau_0 day^-^1)')