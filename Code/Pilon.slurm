#!/bin/bash
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 00:35:00
#SBATCH -J Pilon
#SBATCH --mail-type=ALL
#SBATCH --mail-user emelie.flisberg.4062@student.uu.se
#SBATCH --output=/home/emeliefl/Genome-Analysis-1MB462-/Output_slurm/%x.%j.out
#SBATCH --error=/home/emeliefl/Genome-Analysis-1MB462-/Output_slurm/%x.%j.err

# Load modules
module load Pilon/1.24-Java-17

ref=/home/emeliefl/Genome-Analysis-1MB462-/Data/Flye/assembly.fasta
bam=/home/emeliefl/Genome-Analysis-1MB462-/Data/BWA/aln-pe.bam
outdir=/home/emeliefl/Genome-Analysis-1MB462-/Data/Pilon
# Commands
pilon --threads 2 --genome $ref --bam $bam --outdir $outdir