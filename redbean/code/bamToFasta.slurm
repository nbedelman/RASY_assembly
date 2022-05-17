#!/bin/bash

#SBATCH -J bamToFasta
#SBATCH -p day
#SBATCH -t 00-05:00  # walltime
#SBATCH -c 24
#SBATCH -N 1
#SBATCH --mem=10G
#SBATCH -e errs/bamToFasta.%j.err
#SBATCH -o outs/bamToFasta.%j.out

inBam="$1"
outFasta=$2

samtools fasta "$inBam" > $outFasta
