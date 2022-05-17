#!/bin/bash
#SBATCH -J "racon"   # job name
#SBATCH -p week
#SBATCH --time=72:00:00   # walltime
#SBATCH --ntasks=10   # number of processor cores (i.e. tasks)
#SBATCH --nodes=1   # number of nodes
#SBATCH --mem-per-cpu=12G   # memory per CPU core
#SBATCH -e errs/racon.%j.err
#SBATCH -o outs/racon.%j.out

reads=$1
sam=$2
reference=$3
raconOut=$4

racon -u -t 80 $reads $sam $reference > $raconOut
