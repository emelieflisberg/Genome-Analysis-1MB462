#!/bin/bash
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 12:00:00
#SBATCH -J RepeatMasker
#SBATCH --mail-type=ALL
#SBATCH --mail-user emelie.flisberg.4062@student.uu.se
#SBATCH --output=/home/emeliefl/Genome-Analysis-1MB462-/Output_slurm/%x.%j.out
#SBATCH --error=/home/emeliefl/Genome-Analysis-1MB462-/Output_slurm/%x.%j.err

# Load modules
module load RepeatMasker/4.2.1-foss-2024a
module load RepeatModeler/2.0.7-foss-2024a

genome=/home/emeliefl/Genome-Analysis-1MB462-/Data/Pilon/pilon.fasta
outdir_modeler=/home/emeliefl/Genome-Analysis-1MB462-/Data/Repeat/Modeler
outdir_masker=/home/emeliefl/Genome-Analysis-1MB462-/Data/Repeat/Masker
db_name=n_japonicum_chr3_db


# Commands

cd $outdir_modeler

BuildDatabase -name $db_name $genome

RepeatModeler -database $db_name -threads 2 -LTRStruct

LIB=$outdir_modeler/$db_name-families.fa

cd $outdir_masker

RepeatMasker -lib $LIB -xsmall -gff -nolow -pa 2 -dir "$outdir_masker" "$genome"