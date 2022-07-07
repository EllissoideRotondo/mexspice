function [targetState, lightTimeCorrection] = spkgps_c(target, epoch, referenceFrame, observer)
    
    % Define exstrinsic functions for code generation
    coder.extrinsic('error')
    
    % Check target platform
    if coder.target('MATLAB')
        [targetState, lightTimeCorrection] = cspice_spkpos( char( string(target) ), epoch, referenceFrame, 'NONE', char( string(observer) ) );
    else
        % Preallocate output
        targetState = zeros(3, 1);
        lightTimeCorrection = 0;
        
        % Call ephemeris
        coder.cinclude( coder.const( getenv("HEADER_PATH") ) )
        coder.ceval('spkgps_c', target, epoch, cstring(referenceFrame), ...
                        observer, coder.wref(targetState), coder.wref(lightTimeCorrection));
    
        % Check for errors
        if failed_c()
            message = getmsg_c();
            reset_c();
            error(message)
        end
    end
end
