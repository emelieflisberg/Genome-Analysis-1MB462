#!/bin/bash 
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 00:30:00
#SBATCH -J FastQC_trimmed
#SBATCH --mail-type=ALL
#SBATCH --mail-user=emelie.flisberg.4062@student.uu.se
#SBATCH -o /home/emeliefl/Genome-Analysis-1MB462-/Output_slurm/%x.%j.out
#SBATCH -e /home/emeliefl/Genome-Analysis-1MB462-/Output_slurm/%x.%j.err

# Load modules
module load FastQC/0.12.1-Java-17

# Commands
fastqc -o /home/emeliefl/Genome-Analysis-1MB462-/Data/FastQC/trimmed_Illumina -t 2 /home/emeliefl/Genome-Analysis-1MB462-/Data/Trimmomatic/chr3_illumina_R1_trimmed_paired.fastq.gz /home/emeliefl/Genome-Analysis-1MB462-/Data/Trimmomatic/chr3_illumina_R2_trimmed_paired.fastq.gz