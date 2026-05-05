#!/bin/bash
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 02:00:00
#SBATCH -J Hisat2
#SBATCH --mail-type=ALL
#SBATCH --mail-user emelie.flisberg.4062@student.uu.se
#SBATCH --output=/home/emeliefl/Genome-Analysis-1MB462-/Output_slurm/%x.%j.out
#SBATCH --error=/home/emeliefl/Genome-Analysis-1MB462-/Output_slurm/%x.%j.err

# load modules
module load HISAT2/2.2.1-gompi-2024a
module load SAMtools/1.22.1-GCC-13.3.0

out_dir=/home/emeliefl/Genome-Analysis-1MB462-/Data/Hisat2
genome=/home/emeliefl/Genome-Analysis-1MB462-/Data/Repeat/Masker/pilon.fasta.masked
index_dir=/home/emeliefl/Genome-Analysis-1MB462-/Data/Hisat2/index
index_base=$index_dir/pilon_index
in_dir=/home/emeliefl/Genome-Analysis-1MB462-/Data/Trimmomatic/RNA

# Commands

hisat2-build $genome $index_base

for f1 in ${in_dir}/*_paired_f1.fq.gz
do
    r2=${f1/_paired_f1.fq.gz/_paired_r2.fq.gz}
    SAMPLE=$(basename $f1 _paired_f1.fq.gz)
    
    echo "Mapping $SAMPLE"

    cd $out_dir
    hisat2 -x $index_base \
        -1 "$f1" \
        -2 "$r2" \
        --threads 2 \
        | samtools sort -o "$out_dir/${SAMPLE}_mapped.bam"

    samtools index "$out_dir/${SAMPLE}_mapped.bam"

done