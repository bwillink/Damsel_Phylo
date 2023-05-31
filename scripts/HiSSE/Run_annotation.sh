#!bin/bash

# load RevBayes
source ~/Applications/spack/share/spack/setup-env.sh
spack load revbayes
 
# summarise tree annotations
rb_command="source(\"./HiSSE/Annot_tree.Rev\");"
echo $rb_command | rb
