function [ ] = p14( )

    [original_xcn, original_xsn, zn] = p11();
    
    cosfn = [];
    sinfn = [];
    for n=1:size(zn,1)
       cosfn = [ cosfn cos(15*pi*n/8)];
       sinfn = [ sinfn sin(15*pi*n/8)];
    end
    
    rcn = zn .* cosfn; %recieved inphase
    rsn = zn .* sinfn; %recieved quadrature component    
    
    % run through low pass filter
    Fc = 1000; Fs = 10000; 
    [b,a] = butter(5,Fc*5/Fs); % get coefficients for filter
    xcn = filter(b,a,rcn);
    
    subplot(2, 1, 1);
    plot(original_xcn);
    title('Original Xcn');
    
    subplot(2, 1, 2);
    plot(xcn);
    title('Demodulated Xcn');
    
    %same as above done to get xsn 
    xsn = filter(b,a,rsn);
end
