#!/bin/bash

#######################
###SETUP ENVIRONMENT###
#######################

mkdir -p errs
mkdir -p outs
mkdir -p data


ln -s ~/scratch60/RASY_assembly/RASY.1/rawFastas/ data

#split fasta directory -> single fasta file
fastaDir=data/rawFastas
fastaFile=data/RASY_concat.fa
#cat $fastaDir/*.fa > $fastaFile

outPrefix=RASY_redbean
redBeanCons=$outPrefix.raw.fa

minimapSam=$outPrefix.mini.sam

##############
###RUN CODE###
##############
sbatch code/runRedBean.slurm $fastaFile $outPrefix

sbatch code/runMinimap.slurm $redBeanCons $fastaFile $minimapSam

sbatch code/runRacon.slurm 
