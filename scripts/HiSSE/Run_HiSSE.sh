#!bin/bash

# load RevBayes
source ~/Applications/spack/share/spack/setup-env.sh
spack load revbayes
 
# run diversification analysis on strongly informed MAP tree
rb_command="source(\"./HiSSE/quick_HiSSE_strong.Rev\");"
echo $rb_command | rb

# run diversification analysis on weakly informed MAP tree
rb_command="source(\"./HiSSE/quick_HiSSE_weak.Rev\");"
echo $rb_command | rb
