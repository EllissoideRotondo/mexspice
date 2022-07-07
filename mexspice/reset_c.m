function [] = reset_c
    % Call cspice reset_c
    
    coder.cinclude( coder.const( getenv("HEADER_PATH") ) )
    coder.ceval('reset_c');
end