function im = pngread( name )
%
%   im =  pngread(name) - read a pnm file
%
%   name:       pnm file name
%
%   im:         returned image (uint8)
%

% convert to a pnm then read the pnm

tname = tmpnam;

cmd = sprintf( "pngtopnm %s > %s\n", name, tname );
system( cmd );
im = pnmread( tname );
cmd = sprintf( "rm %s\n", tname );
system( cmd );



