# **Clade-based multi-species development of microsatellite markers for Andean** ***Ischnura*** **damselflies**

### Description of the data and file structure

The Excel file contains twelve sheets with information corresponding to data obtained from *Ischnura chingaza*, *I. cruzi*, *I. capreolus*, *I. cyane* and *Ischnura* sp. "a".

#### This information includes:

- Sampling localities of the five *Ischnura* taxa used for microsatellite discovery and Individuals used for PCR amplification and validation of microsatellite loci.

- Microsatellite genotypes of individuals from five *Ischnura* taxa.

- Genetic diversity of microsatellite loci for five *Ischnura* taxa.

- Private alleles from five *Ischnura* taxa.

---

###### We employed a multi-individual, multi-species approach to develop and characterize two independent clade-specific microsatellite panels for five *Ischnura* taxa from the Colombian Andes. Rather than developing markers for a single species and subsequently testing their cross-species amplification, we used genomic information from three individuals per taxon to identify and prioritize candidate loci shared among species within each clade. PCR amplification was performed to assess amplification success and polymorphism of the selected microsatellite loci. Each primer pair was tested using DNA from five individuals of each taxon within the corresponding clade. Genetic diversity was characterized separately for each *Ischnura* taxon.

---

### File: `Supplementary_Material.xlsx`

**Description:** This file contains information on the sampling locations, the code of the individuals used to design and validate the microsatellites, and all the results obtained from the analyses.


 - **Sheet 1:** Sampling localities of the five *Ischnura* taxa used for microsatellite discovery in Colombia, including clade assignment, number of sequenced individuals (N), geographic coordinates, and elevation.

---

- **Sheet 2:** Number of paired reads per sample. Sequencing was performed on an Illumina NovaSeq 6000 platform using paired-end sequencing (2 × 250 bp), generating 10 Gb (approximately 25 million reads) of raw data per sample.

---

- **Sheet 3:** Individuals used for PCR amplification and validation of microsatellite loci, including species, sample name ID, locality, coordinates, and elevation.

---

- **Sheet 4:** Individual sequencing and microsatellite discovery statistics. Each row represents one individual. Microsatellite detection included three individuals from each of the five *Ischnura* taxa, with the mean number of raw read pairs per individual ranging from 21.9 to 25.1 million among taxa.

---

- **Sheet 5:** Multilocus microsatellite genotypes of individuals from five *Ischnura* taxa belonging to the hastata and capreolus clades. Allele sizes were determined and binned using Geneious v9.0.

---

- **Sheet 6:** Genetic diversity of 16 microsatellite loci for *I. chingaza*. Number of individuals genotyped (n), allele size range (bp), number of alleles per locus (A), effective number of alleles (AE), observed (HO) and expected (HE) heterozygosity rates, (FIS) inbreeding coefficient, polymorphism information content (PIC), and probability of identity (PID).

---

- **Sheet 7:** Genetic diversity of 16 microsatellite loci for *I. cruzi.* Number of individuals genotyped (n), allele size range (bp), number of alleles per locus (A), effective number of alleles (AE), observed (HO) and expected (HE) heterozygosity rates, (FIS) inbreeding coefficient, polymorphism information content (PIC), and probability of identity (PID).

---

- **Sheet 8:** Private alleles for *I. chingaza* and *I. cruzi.*

---

- **Sheet 9:** Genetic diversity of 18 microsatellite loci for *I. capreolus*. Number of individuals genotyped (n), allele size range (bp), number of alleles per locus (A), effective number of alleles (AE), observed (HO) and expected (HE) heterozygosity rates, (FIS) inbreeding coefficient, polymorphism information content (PIC), and probability of identity (PID).

---

- **Sheet 10:** Genetic diversity of 20 microsatellite loci for *I. cyane*. Number of individuals genotyped (n), allele size range (bp), number of alleles per locus (A), effective number of alleles (AE), observed (HO) and expected (HE) heterozygosity rates, (FIS) inbreeding coefficient, polymorphism information content (PIC), and probability of identity (PID).

---

- **Sheet 11:** Genetic diversity of 18 microsatellite loci for *Ischnura* sp. "a". Number of individuals genotyped (n), allele size range (bp), number of alleles per locus (A), effective number of alleles (AE), observed (HO) and expected (HE) heterozygosity rates, (FIS) inbreeding coefficient, polymorphism information content (PIC), and probability of identity (PID).

---

- **Sheet 12:** Private alleles for *I. capreolus*, *I. cyane* and *Ischnura* sp. “a”

---

###### Genetic diversity was characterized separately for each Ischnura taxon. The number of alleles per locus (A), effective number of alleles (AE), observed heterozygosity (HO), and expected heterozygosity (HE) were calculated using GenAlEx 6.503. Polymorphism information content (PIC) and probability of identity (PID) were calculated separately for each locus and taxon in R v4.4.3 based on allele frequencies estimated from successfully genotyped individuals.

---

### File: `chingaza_genAlex.xlsx`

It contains the microsatellite genotypes of *I. chingaza* in the format used by GenAlex along with its results. This file was used in the R script.

---

### File: `cruzi_genAlex.xlsx`

It contains the microsatellite genotypes of *I. cruzi* in the format used by GenAlex along with its results. This file was used in the R script.

---

### File: `capreolus_genAlex.xlsx`

It contains the microsatellite genotypes of *I. capreolus* in the format used by GenAlex along with its results. This file was used in the R script.

---

### File: `cyane_genAlex.xlsx`

It contains the microsatellite genotypes of *I. cyane* in the format used by GenAlex along with its results. This file was used in the R script.

---

### File: `spa_genAlex.xlsx`

It contains the microsatellite genotypes of *Ischnura* sp. "a" in the format used by GenAlex along with its results. This file was used in the R script.

---

### File: `Script_Analysis.R`

This file contains the R script for the analyses, mainly of Polymorphism information content (PIC) and probability of identity (PID), although it also includes the code to calculate genetic diversity, which was also calculated with GenAlex.

---

###### Private alleles were assessed separately within the two phylogenetic groups (hastata clade and capreolus clade). These analyses included only loci successfully genotyped in all taxa within the corresponding clade and were performed using GenAlEx v6.503 

---

### File: `private_hastata_clade.xlsx`

It contains the microsatellite genotypes of *I. chingaza* and *I. cruzi* in the format used by GenAlex along with its results. 

---

### File: `private_capreolus_clade.xlsx`

It contains the microsatellite genotypes of *I. capreolus*, *I. cyane* and *Ischnura* sp. "a" in the format used by GenAlex along with its results. 

