#!/bin/bash

#SBATCH -J redbean
#SBATCH -p bigmem
#SBATCH -t 01-00:00  # walltime
#SBATCH -c 36
#SBATCH -N 1
#SBATCH --mem=1500G
#SBATCH -e errs/redbean.%j.err
#SBATCH -o outs/redbean.%j.out

readFile=$1
outPrefix=$2
# wtdbg2 -x sq -g 6g -t 96 -L5000 -fo $outPrefix -i $readFile --dump-kbm=midpoint.RASY
wtdbg2 -k 0 -p 19 -K 1000.049988 -A -R -l 5000 --aln-dovetail -1 -S 4 -s 0.05 -X 100 -e 4 -L 5000 -g 6g -t 96 -o $outPrefix -i $readFile
wtpoa-cns -t 96 -i $outPrefix.ctg.lay.gz -fo $outPrefix.raw.fa
