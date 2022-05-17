#!/bin/bash

### DETUP ENVIRONMENT ###

mkdir -p errs
mkdir -p outs
mkdir -p data
mkdir -p data/rawFastas

module load SAMtools/1.7-foss-2018a

### DEFINE VARIABLES ###
pacbioDir=/gpfs/ysm/project/skelly/yaa23/Yara/RASY_Genome_rawdata/
fastaDir=data/rawFastas
fastaFile=data/RASY_concat.fa
outPrefix=RASY_redbean
redBeanCons=$outPrefix.raw.fa
### RUN CODE ###

for i in /gpfs/ysm/project/skelly/yaa23/Yara/RASY_Genome_rawdata/*/*.subreads.bam
do echo $i
name=$(basename "$i")
fasta=$(basename $(echo "$name"|cut -d " " -f 3) .subreads.bam).fasta
echo $fasta
sbatch code/bamToFasta.slurm "$i" $fastaDir/$fasta
done

cat $fastaDir/*.fa > $fastaFile

sbatch code/runRedBean.slurm $fastaFile $outPrefix
