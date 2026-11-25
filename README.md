# **Clade-based multi-species development of microsatellite markers for Andean** ***Ischnura*** **damselflies**

---

###### We employed a multi-individual, multi-species approach to develop and characterize two independent clade-specific microsatellite panels for five *Ischnura* taxa from the Colombian Andes. Rather than developing markers for a single species and subsequently testing their cross-species amplification, we used genomic information from three individuals per taxon to identify and prioritize candidate loci shared among species within each clade. PCR amplification was performed to assess amplification success and polymorphism of the selected microsatellite loci. Each primer pair was tested using DNA from five individuals of each taxon within the corresponding clade. Genetic diversity was characterized separately for each *Ischnura* taxon.

---

### Description of the repository

This repository contains two folders: data and bin

**Data:** In this folder are the input `.xlsx` files to perform the following analyses:

- Genetic diversity: This was characterized separately for each *Ischnura* taxon. The number of alleles per locus (A), effective number of alleles (AE), observed heterozygosity (HO), and expected heterozygosity (HE) were calculated using GenAlEx 6.503.

- Private alleles: This were identified among the sampled individuals. Private alleles were assessed separately within the two phylogenetic groups (hastata clade and capreolus clade). These analyzes included only loci successfully genotyped in all taxa within the corresponding clade and were performed using GenAlEx v6.503.

- Polymorphism information content (PIC) and probability of identity (PID): This were calculated separately for each locus and taxon in R v4.4.3 based on allele frequencies estimated from successfully genotyped individuals.

**Bin:** This folder contains the .R file `Script_Analysis.R`. This was the R code for the analyses, mainly of Polymorphism information content (PIC) and probability of identity (PID), although it also includes the code to calculate genetic diversity, which was also calculated with GenAlex.
