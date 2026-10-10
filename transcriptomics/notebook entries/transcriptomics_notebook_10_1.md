# Transcriptomics notebook

**Course:** Intro to Ecological Genomics - Fall 2026

**Name:** Meron Abraham

**Date:**10/1/2026

------------------------------------------------------------------------

## Day 5 of Transcriptomics tutorial

-   Generating figures showing upregulated and downregulated genes across all treatments, Gen 1 

### Working directory

`/gpfs1/home/m/a/mabraha3/projects/eco_genomics_2026/transcriptomics`

### Input files

`none`

### Output files

`/gpfs1/home/m/a/mabraha3/projects/eco_genomics_2026/transcriptomics/transcriptomics_notebook_9_29.md`

### Scripts

`AHUD_DESeq_pt2_9-29.R`

### Code

Starting R session: `load ecogen-rlibs`

```         
setwd("~/projects/eco_genomics_2026/transcriptomics/mydata")
```

### Programs/dependencies

`R version 4.5.1` `tidyverse` `RStudio`

### Graphs/images

### Expression of one gene across treatments in F0

This one gene was expressed the least in the ambient treatment, and expressed most in the OW and OWA treatments.

![](myresults/plots/Rplot.png)

### Differently Expressed Genes (DEGs) between OW and AM treatments

More genes are upregulated than downregulated. Gray points are genes with no significant difference.

![](myresults/plots/Rplot01.png)

### DEGs between OW and AM treatments

Similar to the MA-plot, but shows significance in more detail.

![](myresults/plots/Rplot02.png)

### Heatmap of DEGs across treatments, grouped by similar expression

Generally, AM treatment resulted in less expression overall, and both OW and OWA treatments resulted in higher expression in the top 100 DEGs.

![](myresults/plots/Rplot03.png)

### Overlap in DEGs across treatment groups

OWA and OW treatment groups have the most overlap in DEGs; OW resulted in the most DEGs, OA resulted in the fewest.

![](myresults/plots/Rplot04.png)

### Upset plot - similar to Euler plot, but in a different way of visualizing the same data (also in a way I prefer)

![](myresults/plots/Rplot05.png)

### Tables

| Col1 | Col2 | Col3 | Col4 | Col5 |
|------|------|------|------|------|
|      |      |      |      |      |
|      |      |      |      |      |
|      |      |      |      |      |

#### Notes/observations

OWA and OW resulted in stronger responses, shown in how these treatment groups resulted in the most DEGs and most overlap between eachother. OA resulted in a lower response, suggesting a synergistic effect of the combination of ocean acidification and warming.

### Next steps
