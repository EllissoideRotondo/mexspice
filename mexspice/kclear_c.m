function [] = kclear_c() %#codegen
    
    if coder.target("MATLAB")
        cspice_kclear()
    else
        % Call cspice kclear_c
        coder.cinclude( coder.const( getenv("HEADER_PATH") ) )
        coder.ceval('kclear_c');
    end
enc