function [] = erract_c()
    
    if coder.target("MATLAB")
        return
    else
        % Set error behavior
        coder.cinclude( coder.const( getenv("HEADER_PATH") ) )
        coder.ceval('erract_c', cstring('SET'), uint8(255), cstring('RETURN'));
    end
end