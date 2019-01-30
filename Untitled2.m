s=tf('s');
plant=1/(s^3+6*(s^2)+5*s);

Kp=0.000025;
Kd=45.31;
Ki=53

cont = Kp+Ki/s+Kd*s;
figure;
step(feedback(plant*cont,1))