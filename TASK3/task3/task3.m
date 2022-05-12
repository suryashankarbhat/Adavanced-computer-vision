clear;
close all;
x=csvread('C:\Users\Computing\Downloads\x.csv');
y=csvread('C:\Users\Computing\Downloads\y.csv');
u=csvread('C:\Users\Computing\Downloads\a.csv');
v=csvread('C:\Users\Computing\Downloads\b.csv');


nx = u - x;
ny = v - y;


% mean(nx)
% std(nx)
% mean(ny)
% std(ny)
figure
hist(nx,5)
figure
hist(ny,5)
figure
plot(x, y, 'xb');
hold;
plot(u, v, '+r');
title('noise')

%task2
z=[u;v]
[px, py] = kalmanTracking(z)
plot(x, y, 'xb');
hold;
plot(px, py, '+r');




plot(x, y, 'xb', px, py, '+r',u,v, 'og');
legend({'x,y = real(x,y)','px,py = predicted(x,y)','u,v = noise(u,v)'},'Location','southeast')
%hold;
%plot(px, py, '+r');
%hold;
%plot(u,v);

e = sqrt( ((x - px).^2)+((y - py).^2) )


rms= (rms(e))
m=mean(e)

sd=std(e)
