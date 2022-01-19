#!bin/bash

# load RevBayes
source ~/Applications/spack/share/spack/setup-env.sh
spack load revbayes

# run the dating analysis
rb_command="source(\"./bg_dating/MAP.Rev\");"
echo $rb_command | rb
