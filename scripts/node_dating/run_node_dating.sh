#!/bin/bash

#SBATCH -A snic2022-5-419
#SBATCH -p node -C mem256GB
#SBATCH -t 10-00:00:00
#SBATCH -J node_dating
#SBATCH --mail-type=Fail
#SBATCH --mail-user beatriz.willink@zoologi.su.se

#module load bioinfo-tools
#module load pgi/18.3
#module load openmpi/3.1.3
#module load RevBayes/1.1.1

source ~/Applications/spack/share/spack/setup-env.sh
spack load revbayes


# run node dating analysis with relaxed variance between molecular clocks

date

rb_command="source(\"./node_dating/coen.g0.fossil.flat.Rev\");"
echo $rb_command | rb

date
