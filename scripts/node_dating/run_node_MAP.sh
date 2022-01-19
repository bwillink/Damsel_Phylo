#!bin/bash

# burned trees before loading on rb or it will crash
cat ../output/node_dating/Coen.g0.fossil.calib.flat.973180.trees | tail -6001 > ../output/node_dating/Coen.g0.fossil.calib.flat.973180.burned.trees


# run the dating analysis
rb_command="source(\"./node_dating/node_MAP.Rev\");"
echo $rb_command | ~/Applications/revbayes-development/projects/cmake/rb
