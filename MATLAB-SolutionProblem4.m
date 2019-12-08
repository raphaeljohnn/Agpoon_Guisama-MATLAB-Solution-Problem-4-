%get input values
initialh=input('Input initial height:');
V=input('Input velocity:');
theta=input('Input theta(degrees):');
ax=input('Input acceleration x-component including the sign:');
ay=input('Input acceleration y-component including the sign:');

if (ay==0)
    error('Error.');
    error('Acceleration value must not be 0');
end

Viy=V*sin(theta*pi/180);%y component of initial velocity
Vix=V*cos(theta*pi/180);%x component of initial velocity

timepk=-Viy/ay; % time to peak height
totaly=initialh+Viy*timepk+0.5*ay*timepk^2; % total y traveled
tpk_gnd=sqrt(2*totaly/abs(ay)); %time from peak height to ground

flighttime=timepk+tpk_gnd; % total time traveled
range=Vix*flighttime+0.5*ax*flighttime; % total range (x-axis)

time=0:flighttime/1000:flighttime-flighttime/1000; %time for x-axis plotting ang y computation

y=initialh+Viy.*time+0.5*ay*time.^2; % y values

if (Vix>0 && ax>=0)
    x=0:(range/1000):range-(range/1000);
elseif (Vix<0 && ax<=0)  % if -ax, shift the travel to the left
    x=range+(abs(range)/1000):(abs(range)/1000):0;
    y=flip(y);
end

plot(x,y);
title('Projectile Trajectory');
xlabel('Range (m)');
ylabel('Height (m)');
grid on;