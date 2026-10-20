#!/bin/bash
#SBATCH --job-name=pca
#SBATCH --partition=general
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=16G
#SBATCH --time=8:00:00
#SBATCH --output=./logs/%x.%j.out
#SBATCH --error=./logs/%x.%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mabraha3@uvm.edu

cd /gpfs1/m/a/mabraha3/projects/eco_genomics_2026/population_genomics/mydata

module load admixture
module load plink

data_dir=/projects/eco_genomics_2026/population_genomics/mydata

echo $data_dir

VCF=$data_dir/Lottia_gigantea_pl_flt3.renamed.vcf.gz

echo $VCF

#LD thin
plink --vcf $VCF --double-id --allow-extra-chr \
    --set-missing-var-ids @:# \
    --indep-pairwise 50 10 0.2 \
    --out $OUTDIR=Lg_LD_0.2_alldata

#PCA
plink --vcf $VCF --double-id --allow-extra-chr --set-missing-var-ids @:# \
    --extract Lg_LD_0.2.prune.in \
    --make-bed --pca --out $OUTDIR=Lg_LD_0.2_alldata
