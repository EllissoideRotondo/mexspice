% Update buildInfo object to include CSPICE library
% Description:
%   This function updates a BuildInfo object by including the CSPICE 
%   source path, header path and compiled library. This is required
%   whenever code is generated for a function calling a CSPICE wrapper.
%
%
%  Input:
%     buildInfo [RTW.BuildInfo] - build information used for code generation
%
%  Output:
%     none
%
% Disclaimer:
%   Last editor : Alex Pascarella
%   Last edit on: 11.05.2022
%
%   Copyright (c) 2022 Alex Pascarella.
%

function [] = setSpiceBuildInfo(buildInfo)
    buildInfo.addIncludePaths(getenv("INCLUDE_PATH"));
    buildInfo.addIncludePaths(getenv("SOURCE_PATH"));
    buildInfo.addLinkObjects(getenv("LIB_NAME"), getenv("LIB_PATH"), '', true, true);
    if ispc
        buildInfo.addLinkFlags('/NODEFAULTLIB:libcmt');
    end
end
