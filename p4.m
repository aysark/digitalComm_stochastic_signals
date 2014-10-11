function [ ] = p4( sample_data )
%p4([randn(1000,1),randn(1000,1)])
    x = p1(sample_data);
    x1 = x(:,1);
    x2 = x(:,2);
    m = p2(sample_data);
    
    v1 = 0;
    v2 = 0;
    c12 = 0;
    n = size(x1,1);
    for k= 1:n;
        v1 = v1 + (x1(k) - m(:,1)).^2;
        v2 = v2 + (x2(k) - m(:,2)).^2;
        c12 = c12 + (x1(k) - m(:,1)).*(x2(k) - m(:,2));
    end
    
    v1 = v1/n
    v2 = v2/n
    c12 = c12/n
end

