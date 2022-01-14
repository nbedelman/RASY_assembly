#!/bin/bash

#SBATCH -J copyToAWS
#SBATCH -p day
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -t 0-24:00
#SBATCH --mem=1000
#SBATCH -e copytoAWS.err
#SBATCH -o copytoAWS.out



#aws s3 cp --recursive /gpfs/loomis/project/skelly/aa2258/2019_RASY_YMF_PopGen/1.YMF_pilot/0.sequence_data/YMF_2018Pilot_fastqs/ s3://genomeark-upload/rana-sylvatica/pacbio/
aws s3 --no-sign-request cp --recursive s3://genomeark/species/Rana_sylvatica/aRanSyl1/ data/
