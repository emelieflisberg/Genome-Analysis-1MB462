#!/bin/bash 
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 01:00:00
#SBATCH -J FastQC_RNA
#SBATCH --mail-type=ALL
#SBATCH --mail-user=emelie.flisberg.4062@student.uu.se
#SBATCH -o /home/emeliefl/Genome-Analysis-1MB462-/Output_slurm/%x.%j.out
#SBATCH -e /home/emeliefl/Genome-Analysis-1MB462-/Output_slurm/%x.%j.err

# Load modules
module load FastQC/0.12.1-Java-17

# Commands
fastqc -o /home/emeliefl/Genome-Analysis-1MB462-/Data/FastQC/RNA -t 2 /crex/proj/uppmax2026-1-61/Genome_Analysis/2_Zhou_2023/reads/transcriptomic_data/Control_1_f1.fq.gz /crex/proj/uppmax2026-1-61/Genome_Analysis/2_Zhou_2023/reads/transcriptomic_data/Control_1_r2.fq.gz /crex/proj/uppmax2026-1-61/Genome_Analysis/2_Zhou_2023/reads/transcriptomic_data/Heat_treated_42_12h_1_f1.fq.gz /crex/proj/uppmax2026-1-61/Genome_Analysis/2_Zhou_2023/reads/transcriptomic_data/Heat_treated_42_12h_1_r2.fq.gz /crex/proj/uppmax2026-1-61/Genome_Analysis/2_Zhou_2023/reads/transcriptomic_data/Control_2_f1.fq.gz /crex/proj/uppmax2026-1-61/Genome_Analysis/2_Zhou_2023/reads/transcriptomic_data/Control_2_r2.fq.gz /crex/proj/uppmax2026-1-61/Genome_Analysis/2_Zhou_2023/reads/transcriptomic_data/Heat_treated_42_12h_2_f1.fq.gz /crex/proj/uppmax2026-1-61/Genome_Analysis/2_Zhou_2023/reads/transcriptomic_data/Heat_treated_42_12h_2_r2.fq.gz /crex/proj/uppmax2026-1-61/Genome_Analysis/2_Zhou_2023/reads/transcriptomic_data/Control_3_f1.fq.gz /crex/proj/uppmax2026-1-61/Genome_Analysis/2_Zhou_2023/reads/transcriptomic_data/Control_3_r2.fq.gz /crex/proj/uppmax2026-1-61/Genome_Analysis/2_Zhou_2023/reads/transcriptomic_data/Heat_treated_42_12h_3_f1.fq.gz /crex/proj/uppmax2026-1-61/Genome_Analysis/2_Zhou_2023/reads/transcriptomic_data/Heat_treated_42_12h_3_r2.fq.gz