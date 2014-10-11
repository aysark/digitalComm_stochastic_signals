function [ r, mean, variance ] = p5( sample_data )
%p5([rand(1000,1)])
    close all;
    a = -0.5;
    b = 0.5;
    r = a + (b-a).*sample_data(:,1);
    mean = sum(r) ./ size(r,1);
    n = size(r,1);
    variance = 0;
    for k= 1:n
        variance = variance + (r(k) - mean(:,1)).^2;
    end
    variance = variance / n;
%     histfit(r);
%     title('Xn');
end

