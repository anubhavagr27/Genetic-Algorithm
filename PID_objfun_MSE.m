function [x_pop, fx_val]=PID_objfun_MSE(x_pop,options)
den1=[1 6 5 0];
num1=[1];
sysrl=tf(num1,den1); 
Kp=x_pop(2);
Ki=x_pop(3);
Kd=x_pop(1);
%____________________________________________________________________
%creating the PID controller from current values
pid_den=[1 0];
pid_num=[Kd Kp Ki];
pid_sys=tf(pid_num,pid_den); %overall PID controller
%Placing PID controller in unity feedback system with 'sysrl'
sys_series=series(pid_sys,sysrl);
sys_controlled=feedback(sys_series,1);
%____________________________________________________________________
time =0:0.1:30;
[y t] = step(sys_controlled,time); % Step response of closed-loop system
%____________________________________________________________________
%Calculating the error
for i=1:301
    error(i) = 1-y(i);
end
% %Calculating the MSE
error_sq = error*error';
MSE=error_sq/max(size(error));
S = stepinfo(sys_controlled);
Mp=((S.Overshoot+1)*y(301))/100;
Ts= S.SettlingTime;
Tr=S.RiseTime;
P_I=0.6*Mp+0.3*Ts+0.1*Tr;%+0.1*MSE;%0.3*Ts+0.1*Tr;
%____________________________________________________________________
%Ensuring controlled system is stable
poles=pole(sys_controlled);
if poles(1)>0
MSE=100e300;
elseif poles(2)>0
MSE=100e300;
elseif poles(3)>0
MSE=100e300;
elseif poles(4)>0
MSE=100e300;
%elseif poles(5)>0
%MSE=100e300;
end
fx_val=1/MSE; 