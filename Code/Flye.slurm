#!/bin/bash
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH --mem=64GB
#SBATCH -t 60:00:00
#SBATCH -J Flye_Nanopore
#SBATCH --mail-type=ALL
#SBATCH --mail-user emelie.flisberg.4062@student.uu.se
#SBATCH --output=/home/emeliefl/Genome-Analysis-1MB462-/Output_slurm/%x.%j.out
#SBATCH --error=/home/emeliefl/Genome-Analysis-1MB462-/Output_slurm/%x.%j.err

# Load modules
module load Flye/2.9.6-GCC-13.3.0

# Commands
flye \
--nano-raw "/crex/proj/uppmax2026-1-61/Genome_Analysis/2_Zhou_2023/reads/genomics_chr3_data/chr3_clean_nanopore.fq.gz" \
--out-dir /home/emeliefl/Genome-Analysis-1MB462-/Data/Flye \
--threads 2 \