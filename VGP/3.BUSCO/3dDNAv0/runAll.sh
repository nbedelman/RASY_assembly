#!/bin/bash

###SETUP ENVIRONMENT###
module load miniconda
conda activate haplotagging

mkdir -p errs
mkdir -p outs
mkdir -p BUSCO_out
mkdir -p data

#cp /home/nbe4/scratch60/RASY_assembly/VGP/2.HiC/polished/aRanSyl1_s2_polished2.wrap.FINAL.fasta data/

###DEFINE VARIABLES###
assembly=data/aRanSyl1_s2_polished2.wrap.FINAL.fasta
lineage=vertebrata_odb10
outDir=BUSCO_out

###RUN CODE###
sbatch code/runBusco.slurm $assembly $lineage $outDir
