function eval = individualevaluation(A)
%AΪ��Ⱥ��һ�����壬��һ��1x2255����������ÿ��ֵΪ0��1
eval = 1;
scale = 2255;
%scale = 2269;
load('expandA.mat');
evalarray = zeros(5,2255);%���ڴ����ж����ݵľ���
evalarray(1,:) = A;

for i = 1:2255
    if(A(i)==1)
        evalarray(2:5,i) = expandA(i,:);
    end
end

%���ж��Ƿ��з���
temp = 0;
for i = 1:2255
    if(A(i)==1)
        if(temp==evalarray(4,i))
            eval = 0;
            return
        else
            temp = evalarray(4,i);
        end
    end
end


timeaxis = zeros(1,178);%ʱ�����Ϊ178
for i = 1:2255
    if(evalarray(1,i)==1)
        for t = evalarray(2,i):(evalarray(3,i)-1)
            timeaxis(t) = timeaxis(t)+1;
        end
        for u = evalarray(4,i):(evalarray(5,i)-1)
            timeaxis(u) = timeaxis(u)+1;
        end
    end
end
for t = 1:178
    if(timeaxis(t)>5)%�������1����5������ж�5��׷�����ɲ�����
        eval = 0;
        break;
    end
end
%��A���У��򷵻�1�������򷵻�0
end

