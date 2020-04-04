function result = rotation_func(F)
% ����FΪ��������2��N�У���һ��Ϊǰ0.1���ڷ������ڶ���Ϊ0��ʱ����
N=length(F(1,:)); %����
m=3.6;%�ĵ�����
h=0.22; %�ĵĺ��
R=0.2;%�ĵİ뾶
angle=2*pi/N*(0:(N-1));
Time_sec=[1 2];
lapse=0.1;%ʱ����
omiga=0;%���ٶ�
J=1/2*m*R^2+1/12*m*h^2;%ת������
theta=0;
Direction_vector=[0 0 1];%���淨����
b=[0,0,1];
for t=Time_sec
    moment=0; %����
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

