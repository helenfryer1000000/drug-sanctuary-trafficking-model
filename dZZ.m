function dZZ=dZZ(t,Z)

global beta z0 z1 u0 u1 alpha delta deltastar tau0 tau1 B

% X0   X1   Y0   Y1
% Z(1) Z(2) Z(3) Z(4)

dZZ=[B*u0-beta*Z(1)*Z(3)*(1-z0)/u0-(alpha+tau0)*Z(1)+tau1*Z(2),...   
     B*u1-beta*Z(2)*Z(4)*(1-z1)/u1-(alpha+tau1)*Z(2)+tau0*Z(1),...
          beta*Z(1)*Z(3)*(1-z0)/u0-(delta+deltastar+tau0)*Z(3)+tau1*Z(4),...
          beta*Z(2)*Z(4)*(1-z1)/u1-(delta+tau1)*Z(4)+tau0*Z(3)]';     