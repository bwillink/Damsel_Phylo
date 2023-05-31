#!/bin/bash

module load bioinfo-tools
module load pgi/18.3
module load openmpi/3.1.3
module load RevBayes/1.1.1-mpi
 
# run ML estimation for null model
rb_command="source(\"./HiSSE/quick_HiSSE_strong_biome_null.Rev\");"
echo $rb_command | mpirun -np 8 rb-mpi

# run ML estimation for biome-dependent model
rb_command="source(\"./HiSSE/quick_HiSSE_strong_biome_ML.Rev\");"
echo $rb_command | mpirun -np 8 rb-mpi
