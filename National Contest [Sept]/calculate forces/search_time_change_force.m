clear all;clc;
F_1 = 30:0.1:130;
F_5 = 0:0.01:2000;
correspond_force = [];
F = [80 0 0 0 0 0 0 0;
    80 80 80 80 80 80 80 80];
for f1 = F_1
    for f5 = F_5
        F(1,1) = f1;
        F(2,1) = f1;
        F(2,5) = f5;
        result = time_changing_rotation_func(F);
        if result <= 0.000001
            two_force = [f1;f5];
            correspond_force = [correspond_force two_force];
            break;
        end
    end
    disp(f1);
end
plot(correspond_force(1,:), correspond_force(2,:), 'r-');




function result = time_changing_rotation_func(F)
% ����FΪ��������2��N�У���һ��Ϊǰ0.1���ڷ������ڶ���Ϊ0��ʱ����
N=length(F(1,:)); %����
m=3.6;%�ĵ�����
h=0.22; %�ĵĺ��
R=0.2;%�ĵİ뾶
angle=2*pi/N*(0:(N-1));
Time_sec=[1 2];
lapse=0.2;%ʱ����
omiga=0;%���ٶ�
J=1/2*m*R^2+1/12*m*h^2;%ת������
theta=0;
Direction_vector=[0 0 1];%���淨����
b=[0,0,1];
for t=Time_sec
    moment=0; %����
%     if t == 2
%         lapse = 0.2;
%     end
%     if t == 1
%         lapse = 0.1;
%     end
    if norm(F(t,:))==0
        continue
    end
    for i=1:N%����N���˵��������ԭ�������������
        radius=R*[cos(angle(i)),sin(angle(i)),0];
        f=[0,0,11/170*F(t,i)];
        moment =moment+ cross(radius,f);
    end
    a=moment/J;%���ٶ�
    rotate=1/2*a*lapse^2+omiga*lapse;
    axis=rotate/norm(rotate);%ת��
    theta=norm(rotate);%��ת�Ƕ�
    omiga=a*lapse+omiga;
    %������Rodrigues��ת��ʽ������ת��ķ�����
    Direction_vector=Direction_vector*cos(theta)+(1-cos(theta))*dot(Direction_vector,axis)*axis+sin(theta)*cross(axis,Direction_vector);
end
result = acosd(dot(Direction_vector,b));
end
