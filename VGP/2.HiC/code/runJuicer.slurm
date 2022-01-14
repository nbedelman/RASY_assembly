#!/bin/bash

#SBATCH -J Juicer
#SBATCH -p day
#SBATCH --mem=5000
#SBATCH -t 0-05:00
#SBATCH -e errs/Juicer-%j.err
#SBATCH -o outs/Juicer-%j.out

genomeName=$1
topDir=$2
refGenome=$3
faSize=$4
#sitesFile=$5

juicer.sh -g $genomeName -d $topDir -S merge -q day -l week -z $refGenome -p $faSize -s none -a 'RASY_polished' -t 36 -D /home/nbe4/project/software/juicer/SLURM/
