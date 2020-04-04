clear all;
clc;
N=8; %����
m=3.6;%�ĵ�����
h=0.22; %�ĵĺ��
R=0.2;%�ĵİ뾶
angle=2*pi/N*(0:(N-1));
f = [0 0 0 0 0 0 0 0;90 80 80 80 80 80 80 80];%�趨��ͬ�����õ���ͬ�Ľ��
% ������ά����Force��Force��ÿһҳΪ��Ŀ������һ�ַ������
Force(:,:,1) = f;
Force(:,:,2) = [0 0 0 0 0 0 0 0;90 90 80 80 80 80 80 80];
Force(:,:,3) = [0 0 0 0 0 0 0 0;90 80 80 90 80 80 80 80];
Force(:,:,4) = [80 0 0 0 0 0 0 0;80 80 80 80 80 80 80 80];
Force(:,:,5) = [80 80 0 0 0 0 0 0;80 80 80 80 80 80 80 80];
Force(:,:,6) = [80 0 0 80 0 0 0 0;80 80 80 80 80 80 80 80];
Force(:,:,7) = [90 0 0 0 0 0 0 0;90 80 80 80 80 80 80 80];
Force(:,:,8) = [0 80 0 0 80 0 0 0;90 80 80 90 80 80 80 80];
Force(:,:,9) = [0 0 0 0 80 0 0 80;90 80 80 90 80 80 80 80];
Time_sec=[1 2];
lapse=0.1;%ʱ����
result = [];

for k = 1:9
    omiga=0;%���ٶ�
    J=1/2*m*R^2+1/12*m*h^2;%ת������
    theta=0;
    Direction_vector=[0 0 1];%���淨����
    b=[0,0,1];
    for t=Time_sec
        moment=0; %����
        if norm(Force(t,:,k))==0
            continue
        end
        for i=1:N%����N���˵��������ԭ�������������
            radius=R*[cos(angle(i)),sin(angle(i)),0];
            F=[0,0,11/170*Force(t,i,k)];
            moment =moment+ cross(radius,F);
        end
        a=moment/J;%���ٶ�
        rotate=1/2*a*lapse^2+omiga*lapse;
        axis=rotate/norm(rotate);%ת��
        theta=norm(rotate);%��ת�Ƕ�
        omiga=a*lapse+omiga;
        %������Rodrigues��ת��ʽ������ת��ķ�����
        Direction_vector=Direction_vector*cos(theta)+(1-cos(theta))*dot(Direction_vector,axis)*axis+sin(theta)*cross(axis,Direction_vector);
    end
    result_now = acosd(dot(Direction_vector,b));
    disp(result_now);
    result = [result result_now];
end
disp(result);


