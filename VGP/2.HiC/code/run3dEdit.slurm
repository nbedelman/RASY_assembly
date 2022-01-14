#!/bin/bash

#SBATCH -J 3d-dna
#SBATCH -p bigmem
#SBATCH --mem=100G
#SBATCH -t 1-00:00
#SBATCH -c 36
#SBATCH -e errs/3d-dna-%j.err
#SBATCH -o outs/3d-dna-%j.out

 refGenome=$1
 topDir=$2
# #
cd $topDir

~/project/software/3d-dna/run-asm-pipeline.sh -f --editor-repeat-coverage 5 $refGenome $topDir/aligned/merged_nodups.orig.16.txt
#~/project/software/3d-dna/visualize/run-asm-visualizer.sh polished/aRanSyl1_s2_polished2.cprops polished/aRanSyl1_s2_polished2.0.asm polished/aligned/merged_nodups.orig.16.txt
