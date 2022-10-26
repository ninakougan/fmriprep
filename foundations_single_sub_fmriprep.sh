#!/usr/bin/bash

#SBATCH -A p31589
#SBATCH -p normal
#SBATCH -t 24:00:00
#SBATCH --mem=64G
#SBATCH -J fmriprep_single_sub

module purge
module load singularity/latest
echo "modules loaded" 
cd /projects/b1108
pwd
echo "beginning preprocessing"

singularity run --cleanenv -B /projects/b1108:/projects/b1108 /projects/b1108/software/singularity_images/fmriprep-1.5.4.simg /projects/b1108/data/Georgia/foundations/ /projects/b1108/projects/georgia/foundations/fmriprep participant --participant-label ${1} -t MID --fs-license-file /projects/b1108/software/freesurfer_license/license.txt --fs-no-reconall -w /projects/b1108/projects/georgia/foundations/work
