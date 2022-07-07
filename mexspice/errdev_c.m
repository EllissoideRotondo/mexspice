function [] = errdev_c()
    % Check target platform
    if coder.target("MATLAB")
        return
    else
        % Set error output device
        coder.cinclude( coder.const( getenv("HEADER_PATH") ) )
        coder.ceval('errdev_c', cstring('SET'), uint8(255), cstring('NULL'));
    end
end