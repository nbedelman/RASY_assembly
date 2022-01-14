#!/bin/bash

#SBATCH -J 3d-dna
#SBATCH -p week
#SBATCH --mem=150G
#SBATCH -t 4-00:00
#SBATCH -c 36
#SBATCH -e errs/3d-dna-%j.err
#SBATCH -o outs/3d-dna-%j.out

refGenome=$1
topDir=$2
# # #
cd $topDir

~/project/software/3d-dna/run-asm-pipeline.sh --editor-repeat-coverage 5 -f $refGenome $topDir/aligned/merged_nodups.orig.16.txt
#~/project/software/3d-dna/visualize/run-asm-visualizer.sh aRanSyl1_s2_polished2.cprops aRanSyl1_s2_polished2.1.asm aligned/merged_nodups.orig.16.txt
