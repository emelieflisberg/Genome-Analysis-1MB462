#!/bin/bash
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 02:00:00
#SBATCH -J BWA
#SBATCH --mail-type=ALL
#SBATCH --mail-user emelie.flisberg.4062@student.uu.se
#SBATCH --output=/home/emeliefl/Genome-Analysis-1MB462-/Output_slurm/%x.%j.out
#SBATCH --error=/home/emeliefl/Genome-Analysis-1MB462-/Output_slurm/%x.%j.err

# Load modules
module load bwa-mem2/2.3-GCC-13.3.0
module load SAMtools/1.22.1-GCC-13.3.0

ref=/home/emeliefl/Genome-Analysis-1MB462-/Data/Flye/assembly.fasta
read1=/home/emeliefl/Genome-Analysis-1MB462-/Data/Trimmomatic/chr3_illumina_R1_trimmed_paired.fastq.gz
read2=/home/emeliefl/Genome-Analysis-1MB462-/Data/Trimmomatic/chr3_illumina_R2_trimmed_paired.fastq.gz
outdir=/home/emeliefl/Genome-Analysis-1MB462-/Data/BWA

# Commands
bwa-mem2 mem -t 2 $ref $read1 $read2 | samtools sort -o $outdir/aln-pe.bam
samtools index $outdir/aln-pe.bam

