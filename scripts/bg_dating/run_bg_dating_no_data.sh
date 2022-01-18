#!bin/bash

# load RevBayes
source ~/Applications/spack/share/spack/setup-env.sh
spack load revbayes

# run the dating analysis
rb_command="source(\"./bg_dating/coen.g0.flat.Rev\");"
echo $rb_command | rb
