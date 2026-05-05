#!/bin/bash 
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 02:00:00
#SBATCH -J FastQC_trimmed_RNA
#SBATCH --mail-type=ALL
#SBATCH --mail-user=emelie.flisberg.4062@student.uu.se
#SBATCH -o /home/emeliefl/Genome-Analysis-1MB462-/Output_slurm/%x.%j.out
#SBATCH -e /home/emeliefl/Genome-Analysis-1MB462-/Output_slurm/%x.%j.err

# Load modules
module load FastQC/0.12.1-Java-17

out_dir=/home/emeliefl/Genome-Analysis-1MB462-/Data/FastQC/trimmed_RNA
in_dir=/home/emeliefl/Genome-Analysis-1MB462-/Data/Trimmomatic/RNA/


# Commands
for file in ${in_dir}/*paired*.fq.gz
do 
    echo "Running FastQC on $file"
    fastqc -o $out_dir -t 2 $file
done
    