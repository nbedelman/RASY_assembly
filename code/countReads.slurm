#!/bin/bash

#SBATCH -J countreads
#SBATCH -p day
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -t 0-5:00
#SBATCH --mem=1000
#SBATCH -e countreads.err
#SBATCH -o countreads.out



samtools view "$1"| awk '{sum+=length($10)} END {print sum}'  >> baseCount.txt
