function [xcn, xsn, zn] = p11(  )
    [wcn , wsn] = p9(); %adjust range in p9 for clear graphs
    
    xcn = filter([1],[1 -0.5], wcn);
    xsn = filter([1],[1 -0.5], wsn);
    
    cosfn = [];
    sinfn = [];
    for n=1:size(wcn,1)
       cosfn = [ cosfn cos(15*pi*n/8)];
       sinfn = [ sinfn sin(15*pi*n/8)];
    end
    
    % form the net bandpass signal by combining the components
    zn = []
    for i=1:size(wcn,1)
        zn = [zn xcn(i)*cosfn(i) + xsn(i)*sinfn(i)];
    end
    
    subplot(3, 2, 1);
    plot(xcn);
    title('Output Xcn');
    
    subplot(3, 2, 2);
    stem(fft(xcn));
    title('Power Spectrum of Xcn');
    
    subplot(3, 2, 3);
    plot(xsn);
    title('Output Xsn');
    
    subplot(3, 2, 4);
    stem(fft(xsn));
    title('Power Spectrum of Xsn');
    
    subplot(3, 2, 5);
    plot(zn);
    title('Net Bandpass Signal Zn');
    
    subplot(3, 2, 6);
    stem(fft(zn));
    title('Power Spectrum of Zn');
end

