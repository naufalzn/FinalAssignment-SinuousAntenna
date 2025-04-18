clc; clear all; close all;

tau  = 1.35; %between 1.2 and 1.5
alpha = deg2rad(50); %between 30 and 70 deg
delta = deg2rad(20); %angular width of the arm
N=6;

R0 = 1; %initial radius
R_end = R0*(tau^N); %final radius
np = 1000;
r = linspace(R0,R_end,np);
ang1 = pi/2;

%Polar form
phi1 = delta + alpha*sin((pi*log(r/R0))/log(tau));
phi2 = -delta + alpha*sin((pi*log(r/R0))/log(tau));
phi3 = ang1 + delta + alpha*sin((pi*log(r/R0))/log(tau));
phi4 = ang1 + -delta + alpha*sin((pi*log(r/R0))/log(tau));

phi1_start = delta + alpha*sin((pi*log(R0/R0))/log(tau));
phi2_start = -delta + alpha*sin((pi*log(R0/R0))/log(tau));
phi3_start = ang1 + delta + alpha*sin((pi*log(R0/R0))/log(tau));
phi4_start = ang1 + -delta + alpha*sin((pi*log(R0/R0))/log(tau));

phi1_end = delta + alpha*sin((pi*log(R_end/R0))/log(tau));
phi2_end = -delta + alpha*sin((pi*log(R_end/R0))/log(tau));
phi3_end = ang1 + delta + alpha*sin((pi*log(R_end/R0))/log(tau));
phi4_end = ang1 + -delta + alpha*sin((pi*log(R_end/R0))/log(tau));

x_in1 = R0*cos(phi1_start);
y_in1 = R0*sin(phi1_start);

x_in2 = R0*cos(phi2_start);
y_in2 = R0*sin(phi2_start);

x_in3 = R0*cos(phi3_start);
y_in3 = R0*sin(phi3_start);

x_in4 = R0*cos(phi4_start);
y_in4 = R0*sin(phi4_start);

%t_start = linspace(phi1_start,phi2_start,np);

t_end_1 = linspace(phi1_end,phi2_end,np);
x_ob_1 = R_end*cos(t_end_1);
y_ob_1 = R_end*sin(t_end_1);

t_end_2 = linspace(phi3_end,phi4_end,np);
x_ob_2 = R_end*cos(t_end_2);
y_ob_2 = R_end*sin(t_end_2);

%Cartesian form
x1 = r.*cos(phi1);y1 = r.*sin(phi1);
x2 = r.*cos(phi2);y2 = r.*sin(phi2);
x3 = r.*cos(phi3);y3 = r.*sin(phi3);
x4 = r.*cos(phi4);y4 = r.*sin(phi4);

figure() ; plot(x1,y1, '-b'); 
hold on; plot(x2,y2,'-b');
hold on; plot(-x1,-y1, '-r');
hold on; plot(-x2,-y2,'-r');
hold on; plot(x3,y3,'-g');
hold on; plot(x4,y4,'-g');
hold on; plot(-x3,-y3,'-k');
hold on; plot(-x4,-y4,'-k');

hold on ; plot(x_ob_1,y_ob_1, '-b');
hold on ; plot(-x_ob_1,-y_ob_1, '-r');
hold on ; plot(x_ob_2,y_ob_2, '-g');
hold on ; plot(-x_ob_2,-y_ob_2, '-k');

hold on ; plot([x_in1,x_in2],[y_in1,y_in2], '-b');
hold on ; plot(-[x_in1,x_in2],-[y_in1,y_in2], '-r');
hold on ; plot([x_in3,x_in4],[y_in3,y_in4], '-g');
hold on ; plot(-[x_in3,x_in4],-[y_in3,y_in4], '-k');

lim = 10;
xlim([-lim lim]) ; ylim([-lim lim])