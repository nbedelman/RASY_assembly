#!/bin/bash

#SBATCH -J RepeatModeler
#SBATCH -p week
#SBATCH --mem=50G
#SBATCH -t 4-00:00
#SBATCH -c 36
#SBATCH -N 1
#SBATCH -e errs/RepeatModeler-%j.err
#SBATCH -o outs/RepeatModeler-%j.out

database=$1

nohup ~/project/software/RepeatModeler-2.0.2a/RepeatModeler -database $database -pa 36 -LTRStruct
