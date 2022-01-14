#!/bin/bash

#SBATCH -p day
#SBATCH -t 0-10:00
#SBATCH --mem=100000
#SBATCH -n 1
#SBATCH -e errs/mummerplot-%j.err
#SBATCH -o outs/mummerplot-%j.out

delta=$1
prefix=$2
refFasta=$3
queryFasta=$4

mummerplot --filter -p $prefix -R $refFasta -Q $queryFasta --png --medium $delta
