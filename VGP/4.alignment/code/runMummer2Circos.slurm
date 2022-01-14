#!/bin/bash

#SBATCH -p day
#SBATCH -t 0-10:00
#SBATCH --mem=100000
#SBATCH -c 24
#SBATCH -e errs/mummer2Circos-%j.err
#SBATCH -o outs/mummer2Circos-%j.out

refGenome=$1
queryGenome=$2
outPrefix=$3

mummer2circos -r $refGenome -q $queryGenome -l -o $outPrefix -a nucmer 
