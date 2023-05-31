#!bin/bash

# load RevBayes
source ~/Applications/spack/share/spack/setup-env.sh
spack load revbayes
 
# run diversification analysis on strongly informed MAP tree
rb_command="source(\"./HiSSE/quick_HiSSE_strong_biome.Rev\");"
echo $rb_command | rb

# run diversification analysis on strongly informed MAP tree and ambiguous character coding
rb_command="source(\"./HiSSE/quick_HiSSE_strong_biome_amb.Rev\");"
echo $rb_command | rb

# run diversification analysis on weakly informed MAP tree
rb_command="source(\"./HiSSE/quick_HiSSE_weak_biome.Rev\");"
echo $rb_command | rb

# run diversification analysis on strongly informed MAP tree under the prior
rb_command="source(\"./HiSSE/quick_HiSSE_strong_amb_biome_prior.Rev\");"
echo $rb_command | rb
