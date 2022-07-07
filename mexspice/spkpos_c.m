function [targetState, lightTimeCorrection] = spkpos_c(target, epoch, referenceFrame, aberrationCorrection, observer)
    
    % Define exstrinsic functions for code generation
    coder.extrinsic('error')
    
    % Check target platform
    if coder.target('MATLAB')
        [targetState, lightTimeCorrection] = cspice_spkpos(target, epoch, referenceFrame, aberrationCorrection, observer);
    else
        % Preallocate output
        targetState = zeros(3, 1);
        lightTimeCorrection = 0;
        
        % Call ephemeris
        coder.cinclude( coder.const( getenv("HEADER_PATH") ) )
        coder.ceval('spkpos_c', cstring(target), epoch, cstring(referenceFrame), ...
            cstring(aberrationCorrection), cstring(observer), coder.wref(targetState), coder.wref(lightTimeCorrection));
    
        % Check for errors
        if failed_c()
            message = getmsg_c();
            reset_c();
            error(message)
        end
    end
end
