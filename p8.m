function [  ] = p8( N, m )
%p8(1000,50)
    close all;
    Ry1 = diff_ensemble(N, m);
    Ry2 = diff_ensemble(N, m);
    Ry3 = diff_ensemble(N, m);
    Ry4 = diff_ensemble(N, m);
    Ry5 = diff_ensemble(N, m);
    Ry6 = diff_ensemble(N, m);
    Ry7 = diff_ensemble(N, m);
    Ry8 = diff_ensemble(N, m);
    Ry9 = diff_ensemble(N, m);
    Ry10 = diff_ensemble(N, m);
    
    Ry = Ry1 + Ry2 + Ry3 + Ry4 + Ry5 + Ry6 + Ry7 + Ry8 + Ry9 + Ry10;
    Ry = Ry ./ 10;
    
    Gy = fft(Ry);
    
    subplot(1,2,1);
    plot(Ry);
    title('Ry[m]');
    
    subplot(1,2,2);
    stem(abs(Gy)); %take the abs since its complex numbers
    title('Gy[f]');
end

function [out] = diff_ensemble(N, m)

    Ry = [];
    % build Yn
    r = -0.5 + (0.5- (-0.5)) .* rand(N,1);
    y = filter([1],[1 -0.95],r);
    
    sum = 0;
    for i=0:m % iterate from 0->m since we need y[n+m] for each m
       for j=1:N-i % applying the summation eqn
           sum = sum + (y(j) .* y(j+i));
       end
       % clean up, we need Ry in array form
       Ry = [Ry (1 / (N-i)) * sum];
       sum = 0;
    end
    out = Ry;
end
