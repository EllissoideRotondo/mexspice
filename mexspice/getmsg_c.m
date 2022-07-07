function message = getmsg_c() %#codegen
    % Call cspice getmsg_c
    
    message = cstring(blanks(1840));
    coder.cinclude( coder.const( getenv("HEADER_PATH") ) )
    coder.ceval('getmsg_c', cstring('LONG'), uint16(1841), coder.wref(message));
end