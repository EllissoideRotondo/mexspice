function values = bodvcd_c(bodyId, item, maxSize)
    
    % Define exstrinsic functions for code generation
    coder.extrinsic('error')
    
    % Check target platform
    if coder.target('MATLAB')
        values = cspice_bodvcd(bodyId, item, maxSize);
    else
        % Include cspice header
        coder.cinclude( coder.const( getenv("HEADER_PATH") ) )

        % Call bodvrd_c
        maxn = uint16(maxSize);
        values = zeros(maxn, 1);
        dim = coder.opaque('int', '0');
        coder.ceval('bodvcd_c', bodyId, cstring(item), maxn, coder.wref(dim), coder.wref(values));

        % Check for errors
        if failed_c()
            message = getmsg_c();
            reset_c();
            error(message)
        end
    end
end