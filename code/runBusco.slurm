#!/bin/bash

#SBATCH -p week
#SBATCH -J BUSCO
#SBATCH -t 7-00:00
#SBATCH --mem=150000
#SBATCH -c 20
#SBATCH -N 2
#SBATCH -e errs/BUSCO.%j.err
#SBATCH -o outs/BUSCO.%j.out

genome=$1
outDir=$2
configFile=$3

export BUSCO_CONFIG_FILE="$configFile"

busco -i $genome -l tetrapoda_odb10 -o $outDir -m genome
