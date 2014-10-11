function [ m ] = p2( sample_data )
    % p2([randn(1000,1),randn(1000,1)]);

    x = p1(sample_data);
    x1 = x(:,1);
    x2 = x(:,2);
    
    m1 = 0;
    m2 = 0;
    n = size(x1,1);
    for k= 1:n;
        m1 = m1 + x1(k);
        m2 = m2 + x2(k);
    end
    m = [ m1/n, m2/n];
end

