#!/bin/bash

module load miniconda
conda activate pacbio
module load MAFFT
module load zlib
module load Perl/5.32.0-GCCcore-10.2.0
export PERL5LIB=/home/nbe4/perl5/lib/perl5/x86_64-linux-thread-multi/

mkdir -p data
mkdir -p errs
mkdir -p outs


#ln -s ~/project/RASY_assembly/VGP/data/aRanSyl1_s2.fasta data/aRanSyl1_s2.fasta
ln -s /home/nbe4/project/myersPopStructure/0.assembleClusters/data/aRanTem1.pri.cur.20200424.fasta data/aRanTem1.pri.cur.20200424.fasta


#mkdir -p RepeatMasker_aRanSyl1_s2


### DEFINE VARIABLES ###
refGenomeName=RATE
refGenomeFasta=data/aRanTem1.pri.cur.20200424.fasta


### RUN CODE ###
database=`sbatch code/makeRepeatDatabase.slurm $refGenomeFasta $refGenomeName|cut -d " " -f 4`
sbatch --dependency=afterok:$database code/runRepeatModeler.slurm $refGenomeName

#sbatch code/runRepeatMasker.slurm RM_165353.WedNov31921302021/consensi.fa data/aRanSyl1_s2.fasta
