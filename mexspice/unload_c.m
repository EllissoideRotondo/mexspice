function [] = unload_c(filepath)
    
    % Define exstrinsic functions for code generation
    coder.extrinsic('error')
    
    % Check target platform
    if coder.target('MATLAB')
        cspice_unload(filepath);
    else
        % Call furnsh_c
        coder.cinclude( coder.const( getenv("HEADER_PATH") ) )
        coder.ceval('unload_c', cstring(filepath));
        
        % Check for errors
        if failed_c()
            message = getmsg_c();
            reset_c();
            error(message)
        end
    end
end