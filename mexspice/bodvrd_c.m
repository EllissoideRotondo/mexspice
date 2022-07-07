function values = bodvrd_c(bodyName, item, maxSize)
    
    % Define exstrinsic functions for code generation
    coder.extrinsic('error')
    
    % Check target platform
    if coder.target('MATLAB')
        values = cspice_bodvrd(bodyName, item, maxSize);
    else
        % Get Spice folder
        header_path = coder.const(getSpiceHeaderPath);

        % Include cspice header
        coder.cinclude(header_path);

        % Call bodvrd_c
        maxn = uint16(maxSize);
        values = zeros(maxn, 1);
        dim = coder.opaque('int', '0');
        coder.ceval('bodvrd_c', cstring(bodyName), cstring(item), maxn, coder.wref(dim), coder.wref(values));

        % Check for errors
        if failed_c()
            message = getmsg_c();
            reset_c();
            error(message)
        end
    end
end