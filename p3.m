function [ ] = p3( )
    % the first values obtained are roughly the same, however
    % there are still errors in the randomness of the function.
    % it is not purely random because we are using a deterministic
    % a machine and program to generate it.
    % p2 answers: [0.4093, 0.5182], true theoritical limit 0.5
    
    p2([randn(1000,1),randn(1000,1)])
    p2([randn(10000,1),randn(10000,1)])
    
    % if its 10k samples, approximation seems to be the same
end

