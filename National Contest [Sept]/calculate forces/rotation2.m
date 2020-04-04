N=8; %����
m=3.6;%�ĵ�����
h=0.22; %�ĵĺ��
R=0.2;%�ĵİ뾶
angle=2*pi/N*(0:(N-1));
Force=[80 0 0 0 0 0 0 0;80 80 80 80 80 80 80 80];
Time_sec=[1 2];
lapse=0.1;%ʱ����
omiga=[0 0 0];%���ٶ�
J=1/2*m*R^2+1/12*m*h^2;
theta=0;
Direction_vector=[0 0 1];
b=[0,0,1];
for t=Time_sec
    if t==2
        break;
    end
    moment=[0 0 0]; %����
    for i=1:N
        radius=R*[cos(angle(i)),sin(angle(i)),0];
        F=[0,0,11/170*Force(t,i)];
        moment =moment+ cross(radius,F);
%         disp(i);
%         disp(moment);
%         disp(cross(radius,F));
    end
    a=moment/J;

    rotate=1/2*a*lapse^2+omiga*lapse;
    axis=rotate/norm(rotate);
    theta=norm(rotate);
    omiga=a*lapse+omiga;
    Direction_vector=Direction_vector*cos(theta)+(1-cos(theta))*dot(Direction_vector,axis)*axis+sin(theta)*cross(axis,Direction_vector);
    disp(Direction_vector);
end
acosd(dot(Direction_vector,b));


