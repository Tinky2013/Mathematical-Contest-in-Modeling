clear all;clc;
F = [80 0 0 0 0 0 0 0;
    80 80 80 80 80 80 80 80];
Force_list = 0:0.1:2000;
%%
%��2�Ų����߷����������
F = [80 0 0 0 0 0 0 0;
    80 80 80 80 80 80 80 80];
result_1_2 = [];
min_1_2 = 10;
for k = Force_list
    F(2,2)=k;
    F(2,8)=k;
    temp = rotation_func(F);
    if temp <= min_1_2
        min_1_2 = temp;
    end
    result_1_2 = [result_1_2 temp];
end
%%
%��3�Ų����߷����������
F = [80 0 0 0 0 0 0 0;
    80 80 80 80 80 80 80 80];
result_1_3 = [];
min_1_3 = 100;
for k = Force_list
    F(2,3)=k;
    F(2,7)=k;
    temp = rotation_func(F);
    if temp <= min_1_3
        min_1_3 = temp;
    end
    result_1_3 = [result_1_3 temp];
end
%%
%��4�Ų����߷����������
F = [80 0 0 0 0 0 0 0;
    80 80 80 80 80 80 80 80];
result_1_4 = [];
min_1_4 = 10;
for k = Force_list
    F(2,4)=k;
    F(2,6)=k;
    temp = rotation_func(F);
    if temp <= 0.0004
        disp(k);
    end
    if temp <= min_1_4
        min_1_4 = temp;
    end
    result_1_4 = [result_1_4 temp];
end
%%
%��5�Ų����߷����������
F = [31 0 0 0 0 0 0 0;
    31 80 80 80 80 80 80 80];
result_1_5 = [];
min_1_5 = 10;
for k = Force_list
    F(2,5)=k;
    temp = rotation_func(F);
    if temp == 0
        disp(k)
    end
    if temp <= min_1_5
        min_1_5 = temp;
    end
    result_1_5 = [result_1_5 temp];
end
%%
figure(1);
subplot(1,4,1);
plot(Force_list, result_1_2,'r-');
text(65,min_1_2,['��Сƫ�ƶ���Ϊ',num2str(min_1_2)]);
title('2��8�Ų����߷�������')
subplot(1,4,2);
plot(Force_list, result_1_3,'r-');
text(65,min_1_3,['��Сƫ�ƶ���Ϊ',num2str(min_1_3)]);
title('3��7�Ų����߷�������')
subplot(1,4,3);
plot(Force_list, result_1_4,'r-');
text(65,min_1_4,['��Сƫ�ƶ���Ϊ',num2str(min_1_4)]);
title('4��6�Ų����߷�������')
subplot(1,4,4);
plot(Force_list, result_1_5,'r-');
text(65,min_1_5,['��Сƫ�ƶ���Ϊ',num2str(min_1_5)]);
title('5�Ų����߷�������')
