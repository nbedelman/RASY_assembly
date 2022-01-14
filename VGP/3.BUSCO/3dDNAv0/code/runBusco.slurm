#!/bin/bash

#SBATCH -J BUSCO
#SBATCH -t 1-00:00
#SBATCH -p bigmem
#SBATCH --mem=1000G
#SBATCH -c 36
#SBATCH -e errs/BUSCO-%j.err
#SBATCH -o outs/BUSCO-%j.out

assembly=$1
lineage=$2
outDir=$3

busco -f -c 36 -i $assembly -l $lineage -m genome -o $outDir
