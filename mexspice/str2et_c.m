function et = str2et_c(string)

    % Define exstrinsic functions for code generation
    coder.extrinsic('error', 'getSpiceHeaderPath')

    if coder.target('MATLAB')
        et = cspice_str2et(string);
    else
        % Get Spice folder
        header_path = coder.const(getSpiceHeaderPath);

        % Include cspice header
        coder.cinclude(header_path);

        % Load kernels
        et = 0;
        coder.ceval('str2et_c', cstring(string), coder.wref(et));

        % Check for errors
        if failed_c()
            message = getmsg_c();
            reset_c();
            error(message)
        end
    end
end