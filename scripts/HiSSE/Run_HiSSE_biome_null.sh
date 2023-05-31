#!/bin/bash

source ~/Applications/spack/share/spack/setup-env.sh
spack load revbayes

# run diversification analysis on strongly informed MAP tree
rb_command="source(\"./HiSSE/quick_HiSSE_strong_biome_null.Rev\");"
echo $rb_command | mpirun -np 4 rb
#echo $rb_command | rb

