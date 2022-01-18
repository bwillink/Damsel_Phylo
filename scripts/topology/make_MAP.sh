#!/bin/bash

# extra burn in of 60000 iterations
cat ../output/topology/M3.Uniform_run1.tre | tail -200 > ../output/topology/M3.Uniform_run1_postburn.tre
cat ../output/topology/M3.Uniform_run2.tre | tail -200 > ../output/topology/M3.Uniform_run2_postburn.tre

# concatenate both runs
cat ../output/topology/M3.Uniform_run1_postburn.tre ../output/topology/M3.Uniform_run1_postburn.tre > ../output/topology/M3.Uniform_trace.tre

# load RevBayes
source ~/Applications/spack/share/spack/setup-env.sh
spack load revbayes

# summarise trees
rb_command="source(\"./topology/topology_MAP.Rev\");"
echo $rb_command | rb


