#!/bin/bash

#SBATCH -J 3d-dna
#SBATCH -p day
#SBATCH --mem=100G
#SBATCH -t 1-00:00
#SBATCH -c 24
#SBATCH -e errs/3d-dna-%j.err
#SBATCH -o outs/3d-dna-%j.out

 refGenome=$1
 topDir=$2
 review=$3
 outputDir=$4
# #
cd $outputDir

~/project/software/3d-dna/run-asm-pipeline-post-review.sh -r $review $refGenome $topDir/aligned/merged_nodups.orig.16.txt
