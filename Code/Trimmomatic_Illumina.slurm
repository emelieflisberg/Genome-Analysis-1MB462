#!/bin/bash 
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 08:00:00
#SBATCH -J Trimmomatic_Illumina
#SBATCH --mail-type=ALL
#SBATCH --mail-user emelie.flisberg.4062@student.uu.se
#SBATCH -o /home/emeliefl/Genome-Analysis-1MB462-/Output_slurm/%x.%j.out
#SBATCH -e /home/emeliefl/Genome-Analysis-1MB462-/Output_slurm/%x.%j.err


# Load modules
module load Trimmomatic/0.39-Java-17

trimmomatic PE -threads 2 \
/crex/proj/uppmax2026-1-61/Genome_Analysis/2_Zhou_2023/reads/genomics_chr3_data/chr3_illumina_R1.fastq.gz \
/crex/proj/uppmax2026-1-61/Genome_Analysis/2_Zhou_2023/reads/genomics_chr3_data/chr3_illumina_R2.fastq.gz \
/home/emeliefl/Genome-Analysis-1MB462-/Data/Trimmomatic/Illumina/chr3_illumina_R1_trimmed_paired.fastq.gz \
/home/emeliefl/Genome-Analysis-1MB462-/Data/Trimmomatic/Illumina/chr3_illumina_R1_trimmed_unpaired.fastq.gz \
/home/emeliefl/Genome-Analysis-1MB462-/Data/Trimmomatic/Illumina/chr3_illumina_R2_trimmed_paired.fastq.gz \
/home/emeliefl/Genome-Analysis-1MB462-/Data/Trimmomatic/Illumina/chr3_illumina_R2_trimmed_unpaired.fastq.gz \
ILLUMINACLIP:/sw/arch/eb/software/Trimmomatic/0.39-Java-17/adapters/TruSeq3-PE.fa:2:30:10 \
LEADING:20 TRAILING:20 SLIDINGWINDOW:4:15 MINLEN:50