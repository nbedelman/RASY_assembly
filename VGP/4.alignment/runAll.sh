#!/bin/bash

### SETUP ENVIRONMENT ###
mkdir -p errs
mkdir -p outs

### DEFINE VARIABLES ###
#VGP=data/aRanSyl1_s2.fasta
rTemp=/home/nbe4/project/RASY_assembly/VGP/data/aRanTem1.pri.cur.20200424.fasta
HiC=~/scratch60/RASY_assembly/VGP/2.HiC/finalAssembly_r0.2.chrom/aRanSyl1_s2_polished2.wrap.FINAL.fasta
prefix=HiC.r0.2/woodToCommon.HiC.r0.2.chroms.1000

### RUN CODE ###

#run nucmer
sbatch code/runNucmer.slurm $rTemp $HiC $prefix
