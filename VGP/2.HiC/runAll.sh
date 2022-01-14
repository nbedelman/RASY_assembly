#!/bin/bash


### SETUP ENVIRONMENT ###
module load miniconda
conda activate pacbio
module load BWA/0.7.17-foss-2018a
module load SAMtools/1.7-foss-2018a

mkdir -p data
mkdir -p errs
mkdir -p outs
#mkdir -p juicer
#mkdir -p juicer/fastq
mkdir -p polished
mkdir -p polished/fastq

#ln -s /home/nbe4/scratch60/RASY_assembly/VGP/1.repeatMasker/data/aRanSyl1_s2.fasta.masked data/
#ln -s /home/nbe4/project/RASY_assembly/VGP/data/aRanSyl1_s2_polished2.fa data

### DEFINE VARIABLES ###
#refGenome=$PWD/data/aRanSyl1_s2_polished2.fa
refGenome=$PWD/data/aRanSyl1_s2_polished2.wrap.fa
refName=RASY_polished
topDir=$PWD/polished
faSize=$PWD/data/aRanSyl1_s2_polished2.faSize
#sitesFile=RASY_Arima.txt



### RUN CODE ###
#make bwa index if not already done
#sbatch code/makeBWAindex.slurm $refGenome

#first, run juicer pipeline
#code/runJuicer.slurm $refName $topDir $refGenome $faSize #not using sites file due to github board post saying better not to
#supposed to exit before creating hic files! Could have saved me a couple of weeks...

#then, run 3d-dna pipeline

sbatch code/run3dDNA.slurm $refGenome $topDir

#then, load hic files into juicebox. I manually edited assemblies for both round0 and round1.
#manually uploaded the resulting assembly files. Then, to get final assembly, run:
#mkdir -p finalAssembly_r0
#assembly0=$PWD/polish/aRanSyl1_s2_polished2.0.final.chroms.review.assembly

# mkdir -p finalAssembly_r1
# outDir=finalAssembly_r1
# assembly1=$PWD/polished/aRanSyl1_s2_polished2.1.chroms.review.assembly
#
# sbatch code/run3dFinish.slurm $refGenome $topDir $assembly1 $outDir

#manually copied final output files into new directories.
