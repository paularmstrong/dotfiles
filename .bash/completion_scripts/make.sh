complete -W "`test -e Makefile && grep -oE '^[a-zA-Z0-9-]+:([^=]|$)' Makefile | sed 's/[^a-zA-Z0-9-]*$//'`" make
