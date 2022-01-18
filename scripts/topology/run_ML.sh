#!bin/bash

#load modules: compiler, open mpi and RevBayes
ml load GCC/6.4.0-2.28 OpenMPI/2.1.1
ml load RevBayes/23Nov2017_dev

models=("M1" "M2" "M3" "M4" "M5" "M6")

for i in ${models[@]};
do
  # construct the command string
  rb_command="source(\"ML.$i.Partition.Rev\");"

  # pipe the command into RevBayes
  echo $rb_command | mpirun -bind-to core rb-mpi
done
