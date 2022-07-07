function [] = trcoff_c()
    % Exstrinsic function
    coder.extrinsic('getSpiceHeaderPath')
    if coder.target("MATLAB")
        return
    else
        % Set error behavior
        coder.cinclude( coder.const( getenv("HEADER_PATH") ) )
        coder.ceval('trcoff_c');
    end
end