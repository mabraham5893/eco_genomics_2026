# Population Genomics notebook

**Course:** Intro to Ecological Genomics - Fall 2026

**Name:** Meron Abraham

**Date:** 11/10/2026

------------------------------------------------------------------------

## Homework 2

- Continuing analysis where Lisa left off after completing and plotting PCAs
- Running ADMIXTURE with R^2 for LD set to .5
- Plotting ADMIXTURE RESULTS

### Working directory

`/gpfs1/home/m/a/mabraha3/projects/eco_genomics_2026/population_genomics`

### Input files

`none`

### Output files

`/gpfs1/home/m/a/mabraha3/projects/eco_genomics_2026/population_genomics/notebook entries/pop_gen_notebook_homework2_11_10.md`

### Scripts

`/gpfs1/home/m/a/mabraha3/projects/eco_genomics_2026/population_genomics/homework2/homework_2.R`
`/gpfs1/home/m/a/mabraha3/projects/eco_genomics_2026/population_genomics/homework2/admixture.sh`


### Code

`DATA_DIR=/users/m/a/mabraha3/projects/eco_genomics_2026/population_genomics/mydata `
`VCF=DATA_DIR/Lottia_gigantea_flt3_sub0.01.vcf.gz`

Pruning with Plink (r² > 0.5)
```{bash}
plink --vcf $VCF --double-id --allow-extra-chr \
    --set-missing-var-ids @:# \
    --indep-pairwise 50 10 0.5 \
    --out Lg_LD_0.5
```
983923 SNPs kept, 837827 removed, 1821750 total

Create output files for ADMIXTURE
```{bash}
plink --vcf $VCF --double-id --allow-extra-chr --set-missing-var-ids @:# \
    --extract Lg_LD_0.5.prune.in \
    --make-bed --pca --out Lg_LD_0.5
```
setup for ADMIXTURE
```{bash}
cp Lg_LD_0.5.bim Lg_LD_0.5.bim.orig

awk 'BEGIN{OFS="\t"} {$1="0"; print}' Lg_LD_0.5.bim.orig > Lg_LD_0.5.bim
```

SLURM job for ADMIXTURE
```{bash}
#!/bin/bash
#SBATCH --job-name=admixture
#SBATCH --partition=general
#SBATCH --nodes=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=16G
#SBATCH --time=24:00:00
#SBATCH --output=./logs/%x.%j.out
#SBATCH --error=./logs/%x.%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mabraha3@uvm.edu

cd /gpfs1/home/m/a/mabraha3/projects/eco_genomics_2026/population_genomics/mydata
module load admixture

INPUT="Lg_LD_0.5.bed"
THREADS=${SLURM_CPUS_PER_TASK}   # use as many threads as CPUs we asked for

rm -f cv_errors.tsv
for K in $(seq 1 10); do
    admixture --cv -j${THREADS} "${INPUT}" ${K} | tee "admixture_K${K}.out"
    CV=$(grep "CV error" "admixture_K${K}.out" | awk '{print $NF}')
    echo -e "${K}\t${CV}" >> cv_errors.tsv
done
```
Plotting ADMIXTURE results
```{r}

```

### Programs/dependencies

`R version 4.5.1`
`RStudio`
`Plink version 1.9`

### Graphs/images

### Tables

| Col1 | Col2 | Col3 | Col4 | Col5 |
|------|------|------|------|------|
|      |      |      |      |      |
|      |      |      |      |      |
|      |      |      |      |      |

#### Notes/observations

Observations and interpretations go here

### Next steps
