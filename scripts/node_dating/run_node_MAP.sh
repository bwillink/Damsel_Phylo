#!bin/bash

# burned first 2000 trees before loading on rb
cat ../output/node_dating/Coen.g0.fossil.calib.flat.311333.trees | tail -10001 > ../output/node_dating/Coen.g0.fossil.calib.flat.311333.burned.trees

source ~/Applications/spack/share/spack/setup-env.sh
spack load revbayes

# run the dating analysis
rb_command="source(\"./node_dating/node_MAP.Rev\");"
echo $rb_command | rb
