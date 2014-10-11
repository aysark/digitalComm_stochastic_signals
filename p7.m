function [  ] = p7( N, m )
%p7(1000,50)
    close all;
    Rx1 = diff_ensemble(N, m);
    Rx2 = diff_ensemble(N, m);
    Rx3 = diff_ensemble(N, m);
    Rx4 = diff_ensemble(N, m);
    Rx5 = diff_ensemble(N, m);
    Rx6 = diff_ensemble(N, m);
    Rx7 = diff_ensemble(N, m);
    Rx8 = diff_ensemble(N, m);
    Rx9 = diff_ensemble(N, m);
    Rx10 = diff_ensemble(N, m);
    
    Rx = Rx1 + Rx2 + Rx3 + Rx4 + Rx5 + Rx6 + Rx7 + Rx8 + Rx9 + Rx10;
    Rx = Rx ./ 10;
    
    Gx = fft(Rx);
    
    subplot(1,2,1);
    plot(Rx);
    title('Rx[m]');
    
    subplot(1,2,2);
    stem(abs(Gx)); %take the abs since its complex numbers
    title('Gx[k]');
end

function [out] = diff_ensemble(N, m)

    Rx = [];
    % build Xn
    r = -0.5 + (0.5- (-0.5)) .* rand(N,1);
    sum = 0;
    for i=0:m %iterate from 0->m since we need x[n+m] for each m
       for j=1:N-i % applying the summation eqn
           sum = sum + (r(j) .* r(j+i));
       end
       % clean up, we need Rx in array form
       Rx = [Rx (1 / (N-i)) * sum];
       sum = 0;
    end
    out = Rx;
end