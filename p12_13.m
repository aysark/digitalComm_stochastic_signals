function [  ] = p12_13( )
    
    close all;
    [xcn, xsn, zn] = p11();
    m = 10;
    N = size(xcn, 1);
    
    Rc1 = diff_ensemble(N, m, xcn);
    Rs1 = diff_ensemble(N, m, xsn);
    Rzn1 = diff_ensemble(N, m, zn);
    [xcn, xsn, zn] = p11();
    Rc2 = diff_ensemble(N, m, xcn);
    Rs2 = diff_ensemble(N, m, xsn);
    Rzn2 = diff_ensemble(N, m, zn);
    [xcn, xsn, zn] = p11();
    Rc3 = diff_ensemble(N, m, xcn);
    Rs3 = diff_ensemble(N, m, xsn);
    Rzn3 = diff_ensemble(N, m, zn);
    [xcn, xsn, zn] = p11();
    Rc4 = diff_ensemble(N, m, xcn);
    Rs4 = diff_ensemble(N, m, xsn);
    Rzn4 = diff_ensemble(N, m, zn);
    [xcn, xsn, zn] = p11();
    Rc5 = diff_ensemble(N, m, xcn);
    Rs5 = diff_ensemble(N, m, xsn);
    Rzn5 = diff_ensemble(N, m, zn);
    [xcn, xsn, zn] = p11();
    Rc6 = diff_ensemble(N, m, xcn);
    Rs6 = diff_ensemble(N, m, xsn);
    Rzn6 = diff_ensemble(N, m, zn);
    [xcn, xsn, zn] = p11();
    Rc7 = diff_ensemble(N, m, xcn);
    Rs7 = diff_ensemble(N, m, xsn);
    Rzn7 = diff_ensemble(N, m, zn);
    [xcn, xsn, zn] = p11();
    Rc8 = diff_ensemble(N, m, xcn);
    Rs8 = diff_ensemble(N, m, xsn);
    Rzn8 = diff_ensemble(N, m, zn);
    [xcn, xsn, zn] = p11();
    Rc9 = diff_ensemble(N, m, xcn);
    Rs9 = diff_ensemble(N, m, xsn);
    Rzn9 = diff_ensemble(N, m, zn);
    [xcn, xsn, zn] = p11();
    Rc10 = diff_ensemble(N, m, xcn);
    Rs10 = diff_ensemble(N, m, xsn);
    Rzn10 = diff_ensemble(N, m, zn);
    
    Rc = (Rc1 + Rc2 + Rc3 + Rc4 + Rc5 + Rc6 + Rc7 + Rc8 + Rc9 + Rc10) ./ 10;
    Rs = (Rs1 + Rs2 + Rs3 + Rs4 + Rs5 + Rs6 + Rs7 + Rs8 + Rs9 + Rs10) ./ 10;
    Rzn = (Rzn1 + Rzn2 + Rzn3 + Rzn4 + Rzn5 + Rzn6 + Rzn7 + Rzn8 + Rzn9 + Rzn10) ./ 10;
    
    Gc = abs(fft(Rc));
    Gs = abs(fft(Rs));
    Gzn = abs(fft(Rzn));
    
    subplot(3,2,1);
    plot(Rc)
    title('Rc[m]' );
    subplot(3,2,2);
    stem(Gc)
    title('Gc[k]' );
    
    subplot(3,2,3);
    plot(Rs)
    title('Rs[m]' );
    subplot(3,2,4);
    stem(Gs)
    title('Gs[k]' );
    
    subplot(3,2,5);
    plot(Rzn)
    title('Rzn[m]' );
    subplot(3,2,6);
    stem(Gzn)
    title('Gzn[k]' );
end

function [out] = diff_ensemble(N, m, signal)

    Rx = [];
    sum = 0;
    for i=0:m %iterate from 0->m since we need x[n+m] for each m
       for j=1:N-i % applying the summation eqn
           sum = sum + (signal(j) .* signal(j+i));
       end
       % clean up, we need Rx in array form
       Rx = [Rx (1 / (N-i)) * sum];
       sum = 0;
    end
    out = Rx;
end