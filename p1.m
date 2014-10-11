function [ x ] = p1(sample_data) 
%p1([randn(1000,1),randn(1000,1)])
    close all;
    mean = 0.5;
    rho = 0.5; %covariant
    
    % generate x1 and x2
    x1 = mean + sample_data(:,1);
    x0 = mean + sample_data(:,2);    
    x2 = rho*sample_data(:,1) + sqrt(1 - rho^2)*(sample_data(:,2)) + 0.5;
    
    x = [x1, x2];
    
%     subplot(1,2,1);
%     histfit(x1);
%     title('X1 Sequence');
%     
%     subplot(1,2,2);
%     histfit(x2);
%     title('X2 Sequence');
end

