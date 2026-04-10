#!/bin/bash 
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 00:40:00
#SBATCH -J FastQC_Illumina
#SBATCH --mail-type=ALL
#SBATCH --mail-user=emelie.flisberg.4062@student.uu.se
#SBATCH -o /home/emeliefl/Genome-Analysis-1MB462-/Output_slurm/%x.%j.out
#SBATCH -e /home/emeliefl/Genome-Analysis-1MB462-/Output_slurm/%x.%j.err


# Load modules
module load FastQC/0.12.1-Java-17

fastqc -o /home/emeliefl/Genome-Analysis-1MB462-/Data/FastQC -t 2 /crex/proj/uppmax2026-1-61/Genome_Analysis/2_Zhou_2023/reads/genomics_chr3_data/chr3_illumina_R1.fastq.gz  /crex/proj/uppmax2026-1-61/Genome_Analysis/2_Zhou_2023/reads/genomics_chr3_data/chr3_illumina_R2.fastq.gz
