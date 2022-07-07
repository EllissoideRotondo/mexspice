function [targetState, lightTimeCorrection] = spkgeo_c(target, epoch, referenceFrame, observer)
    
    % Define exstrinsic functions for code generation
    coder.extrinsic('error')
    
    % Check target platform
    if coder.target('MATLAB')
        [targetState, lightTimeCorrection] = cspice_spkgeo(target, epoch, referenceFrame, observer);
    else
        % Preallocate output
        targetState = zeros(6, 1);
        lightTimeCorrection = 0;
        
        % Call ephemeris
        coder.cinclude( coder.const( getenv("HEADER_PATH") ) )
        coder.ceval('spkgeo_c', target, epoch, cstring(referenceFrame), ...
                    observer, coder.wref(targetState), coder.wref(lightTimeCorrection));
    
        % Check for errors
        if failed_c()
            message = getmsg_c();
            reset_c();
            error(message)
        end
    end
end