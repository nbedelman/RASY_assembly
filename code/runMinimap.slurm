#!/bin/bash

#SBATCH -J "minimap2"   # job name
#SBATCH -p day,bigmem
#SBATCH --time=24:00:00   # walltime
#SBATCH -N 10
#SBATCH --ntasks=10   # number of processor cores (i.e. tasks)
#SBATCH --nodes=1   # number of nodes
#SBATCH --mem-per-cpu=50G   # memory per CPU core
#SBATCH -e errs/minimap2.%j.err
#SBATCH -o outs/minimap2.%j.out

#Use this script for long read pacbio/nanopore alignments to a reference.
reference=$1
reads=$2
outSam=$3

minimap2 -t 1000 -ax map-pb $reference $reads >  $outSam
