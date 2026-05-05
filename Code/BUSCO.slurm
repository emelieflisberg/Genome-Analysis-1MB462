#!/bin/bash
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 00:30:00
#SBATCH -J BUSCO
#SBATCH --mail-type=ALL
#SBATCH --mail-user emelie.flisberg.4062@student.uu.se
#SBATCH --output=/home/emeliefl/Genome-Analysis-1MB462-/Output_slurm/%x.%j.out
#SBATCH --error=/home/emeliefl/Genome-Analysis-1MB462-/Output_slurm/%x.%j.err

# Load modules
module load BUSCO/5.8.2-gfbf-2024a


outdir=/home/emeliefl/Genome-Analysis-1MB462-/Data/BUSCO
polished_assembly=/home/emeliefl/Genome-Analysis-1MB462-/Data/Pilon/pilon.fasta


# Commands
busco -i $polished_assembly -m genome -c 2 --out_path $outdir -l embryophyta_odb10 -o BUSCO_results

