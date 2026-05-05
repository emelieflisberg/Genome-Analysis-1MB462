#!/bin/bash 
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 08:00:00
#SBATCH --mem=32G
#SBATCH -J Trimmomatic_RNA
#SBATCH --mail-type=ALL
#SBATCH --mail-user emelie.flisberg.4062@student.uu.se
#SBATCH -o /home/emeliefl/Genome-Analysis-1MB462-/Output_slurm/%x.%j.out
#SBATCH -e /home/emeliefl/Genome-Analysis-1MB462-/Output_slurm/%x.%j.err

in_dir=/crex/proj/uppmax2026-1-61/Genome_Analysis/2_Zhou_2023/reads/transcriptomic_data/

out_dir=/home/emeliefl/Genome-Analysis-1MB462-/Data/Trimmomatic/RNA/

# Load modules
module load Trimmomatic/0.39-Java-17

for f1 in ${in_dir}/*_f1.fq.gz
do
    r2=${f1/_f1.fq.gz/_r2.fq.gz}

    SAMPLE=$(basename $f1 _f1.fq.gz)
    
    echo "Processing $SAMPLE"

    trimmomatic PE -threads 2 \
    "$f1" "$r2" \
    "${out_dir}/${SAMPLE}_paired_f1.fq.gz" "${out_dir}/${SAMPLE}_unpaired_f1.fq.gz" \
    "${out_dir}/${SAMPLE}_paired_r2.fq.gz" "${out_dir}/${SAMPLE}_unpaired_r2.fq.gz" \
    ILLUMINACLIP:/sw/arch/eb/software/Trimmomatic/0.39-Java-17/adapters/TruSeq3-PE.fa:2:30:10 \
    LEADING:20 TRAILING:20 SLIDINGWINDOW:4:15 MINLEN:50
done



