function [] = build()
    % MICE library name
    if ispc
        setenv( "LIB_PATH", "cspice.lib" )
    else
        setenv( "LIB_NAME", "cspice.a" )
    end
    
    % Set library paths
    micepath = fullfile( fileparts(mfilename("fullpath") ), '..', 'mice' );
    setenv( "HEADER_PATH", fullfile(micepath, "src", "cspice", "SpiceUsr.h") )
    setenv( "INCLUDE_PATH", fullfile(micepath, "include") )
    setenv( "SOURCE_PATH", fullfile(micepath, "src", "cspice") )
    setenv( "LIB_PATH", fullfile(micepath, "lib") )
    
    % Build configuration
    cfg = coder.config();
    cfg.PostCodeGenCommand = 'setSpiceBuildInfo(buildInfo)';

    % Generate MEX file
end
