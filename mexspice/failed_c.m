function failed = failed_c() %#codegen
    % Call cspice failed_c
    
    coder.cinclude( coder.const( getenv("HEADER_PATH") ) )
    failed = coder.nullcopy(false);
    failed = coder.ceval('failed_c');
end