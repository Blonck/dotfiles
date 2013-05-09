#/bin/bash

cat config.list \
    | awk '/^[^#]/{ 
                    command=sprintf("ln -snf %s/%s %s", ENVIRON["PWD"],$1, $2) ;
                    printf("Installing %10s as %-20s (%s)\n", $1, $2, command) ;
                    system(command) ;
                  }'

