#!/bin/bash

#SBATCH -J getSitePositions
#SBATCH -p day
#SBATCH --mem=5000
#SBATCH -t 0-10:00
#SBATCH -e errs/getSitePositions-%j.err
#SBATCH -o outs/getSitePositions-%j.out

enzyme=$1
genomeName=$2
refGenome=$3

python /home/nbe4/project/software/juicer/misc/generate_site_positions.py $enzyme $genomeName $refGenome
