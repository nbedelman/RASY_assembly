#!/bin/bash

#SBATCH -p day
#SBATCH -t 0-10:00
#SBATCH --mem=100000
#SBATCH -c 24
#SBATCH -e errs/nucmer-%j.err
#SBATCH -o outs/nucmer-%j.out


refFasta=$1
queryFasta=$2
prefix=$3

nucmer -t 24 -c 1000 -p $prefix $refFasta $queryFasta

show-coords -c -l -L 1000 -T $prefix.delta > $prefix.coords
