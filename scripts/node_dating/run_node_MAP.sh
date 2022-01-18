#!bin/bash

# run the dating analysis
rb_command="source(\"./node_dating/node_MAP.Rev\");"
echo $rb_command | ~/Applications/revbayes-development/projects/cmake/rb
