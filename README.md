gentoo_webos
============

Contain ebuilds to build openwebos components

This repo registered by layman. 
To add this repo into gentoo system, just type: #layman -a webos 

# PmLogLib library caveats:
As single pmloglib library provide two interfaces (public and private),
it was decided to keep these interfaces in two slots of pmloglib (r2 and r1 correspondingly).
Just specify pmloglib:public or pmloglib:private. As by default major version installs first,
regular user shouldn't care.
