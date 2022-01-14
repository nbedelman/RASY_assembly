#!/bin/bash

#SBATCH -J BuildDatabase
#SBATCH -p scavenge
#SBATCH --mem=10000
#SBATCH -t 0-10:00
#SBATCH -N 1
#SBATCH -e errs/buildDatabase-$j.err
#SBATCH -o outs/buildDatabase-$j.out


fastaFile=$1
name=$2

~/project/software/RepeatModeler-2.0.2a/BuildDatabase -name $name $fastaFile
