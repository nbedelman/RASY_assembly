#!/bin/bash

#SBATCH -J RepeatMasker
#SBATCH -p week
#SBATCH --mem=150G
#SBATCH -t 2-00:00
#SBATCH -c 36
#SBATCH -N 1
#SBATCH -e errs/RepeatMasker-%j.err
#SBATCH -o outs/RepeatMasker-%j.out

lib=$1
refGenome=$2


/home/nbe4/project/software/RepeatMasker/RepeatMasker -lib $lib -html -pa 36 $refGenome
