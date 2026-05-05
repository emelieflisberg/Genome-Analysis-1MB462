#!/bin/bash
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 00:10:00
#SBATCH -J QUAST
#SBATCH --mail-type=ALL
#SBATCH --mail-user emelie.flisberg.4062@student.uu.se
#SBATCH --output=/home/emeliefl/Genome-Analysis-1MB462-/Output_slurm/%x.%j.out
#SBATCH --error=/home/emeliefl/Genome-Analysis-1MB462-/Output_slurm/%x.%j.err

# Load modules
module load QUAST/5.3.0-gfbf-2024a

outdir=/home/emeliefl/Genome-Analysis-1MB462-/Data/QUAST
polished_assembly=/home/emeliefl/Genome-Analysis-1MB462-/Data/Pilon/pilon.fasta

# Commands
quast $polished_assembly -o $outdir -t 2