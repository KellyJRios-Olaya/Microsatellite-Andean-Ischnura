
library(readxl)
library(writexl)


##%######################################################%##
#                                                          #
####                   I. chingaza                     ####
#                                                          #
##%######################################################%##

species_name <- "Ischnura chingaza"

file_name <- "chingaza_genAlex.xlsx"

datosch <- read_excel(file_name, col_names = FALSE)

head(datosch)

population_name <- "I. chingaza"

# Convert to standard data frame
datosch <- as.data.frame(datosch)

# Keep only rows corresponding to I. chingaza
datosch <- datosch[
  !is.na(datosch[[2]]) &
    datosch[[2]] == population_name,
]

# Check retained individuals
datosch[, 1:2]

# Check number of individuals
nrow(datosch)

# Define loci for I. chingaza

loci <- c(
  "Chcr-001",
  "Chcr-003",
  "Chcr-004",
  "Chcr-005",
  "Chcr-006",
  "Chcr-007",
  "Chcr-008",
  "Chcr-009",
  "Chcr-010",
  "Chcr-011",
  "Chcr-012",
  "Chcr-013",
  "Chcr-014",
  "Chcr-015",
  "Chcr-017",
  "Chcr-018"
)

######### VALIDATE GENALEX RESULTS IN R FOR I. chingaza ###############

# CALCULATE GENETIC DIVERSITY STATISTICS

calc_stats <- function(a1, a2) {
  
  # Convert allele columns to numeric
  a1 <- as.numeric(a1)
  a2 <- as.numeric(a2)
  
  # A genotype is valid only when BOTH alleles are present and different from zero
  valid <- !is.na(a1) & !is.na(a2) & a1 != 0 & a2 != 0
  
  a1 <- a1[valid]
  a2 <- a2[valid]
  
  # Number of successfully genotyped individuals
  n <- length(a1)
  
  # If no valid genotypes are available
  if (n == 0) {
    
    return(data.frame(
      n   = 0,
      A   = NA,
      AE  = NA,
      HO  = NA,
      HE  = NA,
      FIS = NA,
      PIC = NA,
      PID = NA
    ))
  }
  
  # Allele frequencies
  
  alleles <- c(a1, a2)
  
  freq <- table(alleles) / length(alleles)
  
  p <- as.numeric(freq)
  
  # Number of alleles (A)
  
  A <- length(p)
  
  # Effective number of alleles (AE)
  
  AE <- 1 / sum(p^2)
  
  # Observed heterozygosity (HO)
  
  HO <- sum(a1 != a2) / n
  
  # Expected heterozygosity (HE)
  
  HE <- 1 - sum(p^2)
  
  # Fixation index (FIS)
  # FIS cannot be calculated when HE = 0
  # (monomorphic locus)
  
  if (HE == 0) {
    FIS <- NA
  } else {
    FIS <- 1 - (HO / HE)
  }
  
  ################### PIC AND PID FOR I. chingaza ###############
  
    # Polymorphism Information Content (PIC). Botstein et al. (1980)
  
  sum_pair <- 0
  
  if (length(p) > 1) {
    
    for (i in 1:(length(p) - 1)) {
      for (j in (i + 1):length(p)) {
        
        sum_pair <- sum_pair + (p[i]^2 * p[j]^2)
        
      }
    }
  }
  
  PIC <- 1 - sum(p^2) - 2 * sum_pair
  
  # Probability of Identity (PID). Paetkau et al. (1995)
  
  PID <- 2 * (sum(p^2)^2) - sum(p^4)
  
  # Results

  data.frame(
    n   = n,
    A   = A,
    AE  = AE,
    HO  = HO,
    HE  = HE,
    FIS = FIS,
    PIC = PIC,
    PID = PID
  )
}

# STATISTICS FOR EACH LOCUS

results <- data.frame()

for (i in seq_along(loci)) {
  
  # First allele column for locus i
  col1 <- 3 + (i - 1) * 2
  
  # Second allele column
  col2 <- col1 + 1
  
  stats <- calc_stats(
    datosch[[col1]],
    datosch[[col2]]
  )
  
  stats$Locus <- loci[i]
  
  results <- rbind(results, stats)
}

# REORDER COLUMNS

resultsch <- results[
  ,
  c(
    "Locus",
    "n",
    "A",
    "AE",
    "HO",
    "HE",
    "FIS",
    "PIC",
    "PID"
  )
]

# ROUND VALUES FOR TABLE

resultsch$AE  <- round(results$AE, 3)
resultsch$HO  <- round(results$HO, 3)
resultsch$HE  <- round(results$HE, 3)
resultsch$FIS <- round(results$FIS, 3)
resultsch$PIC <- round(results$PIC, 3)
resultsch$PID <- round(results$PID, 4)

# ADD SPECIES NAME

resultsch$Species <- species_name

resultsch <- resultsch[
  ,
  c(
    "Species",
    "Locus",
    "n",
    "A",
    "AE",
    "HO",
    "HE",
    "FIS",
    "PIC",
    "PID"
  )
]

# VIEW RESULTS

print(resultsch)

# EXPORT RESULTS TO EXCEL

write_xlsx(
  results,
  "microsatellite_results_R_chingaza.xlsx"
)


##%######################################################%##
#                                                          #
####                   I. cruzi                    ####
#                                                          #
##%######################################################%##


species_name <- "Ischnura cruzi"

file_name <- "cruzi_genAlex.xlsx"

datoscr <- read_excel(file_name, col_names = FALSE)

head(datoscr)

population_name <- "I. cruzi"

# Convert to standard data frame
datoscr <- as.data.frame(datoscr)

# Keep only rows corresponding to I. cruzi
datoscr <- datoscr[
  !is.na(datoscr[[2]]) &
    datoscr[[2]] == population_name,
]

# Check retained individuals
datoscr[, 1:2]

# Check number of individuals
nrow(datoscr)

# Define loci

loci <- c(
  "Chcr-001",
  "Chcr-002",
  "Chcr-003",
  "Chcr-004",
  "Chcr-005",
  "Chcr-006",
  "Chcr-007",
  "Chcr-008",
  "Chcr-009",
  "Chcr-011",
  "Chcr-012",
  "Chcr-013",
  "Chcr-014",
  "Chcr-015",
  "Chcr-017",
  "Chcr-018"
)

######### VALIDATE GENALEX RESULTS IN R FOR I. cruzi ###############

# CALCULATE GENETIC DIVERSITY STATISTICS

calc_stats <- function(a1, a2) {
  
  # Convert allele columns to numeric
  a1 <- as.numeric(a1)
  a2 <- as.numeric(a2)
  
  # A genotype is valid only when BOTH alleles are present and different from zero
  valid <- !is.na(a1) & !is.na(a2) & a1 != 0 & a2 != 0
  
  a1 <- a1[valid]
  a2 <- a2[valid]
  
  # Number of successfully genotyped individuals
  n <- length(a1)
  
  # If no valid genotypes are available
  if (n == 0) {
    
    return(data.frame(
      n   = 0,
      A   = NA,
      AE  = NA,
      HO  = NA,
      HE  = NA,
      FIS = NA,
      PIC = NA,
      PID = NA
    ))
  }
  
  # Allele frequencies
  
  alleles <- c(a1, a2)
  
  freq <- table(alleles) / length(alleles)
  
  p <- as.numeric(freq)
  
  # Number of alleles (A)
  
  A <- length(p)
  
  # Effective number of alleles (AE)
  
  AE <- 1 / sum(p^2)
  
  # Observed heterozygosity (HO)
  
  HO <- sum(a1 != a2) / n
  
  # Expected heterozygosity (HE)
 
  HE <- 1 - sum(p^2)
  
  # Fixation index (FIS)
  # FIS cannot be calculated when HE = 0
  # (monomorphic locus)
  
  if (HE == 0) {
    FIS <- NA
  } else {
    FIS <- 1 - (HO / HE)
  }
  
  ####################### PIC ABD PID I. cruzi ######################
  
  # Polymorphism Information Content (PIC). Botstein et al. (1980)
  
  sum_pair <- 0
  
  if (length(p) > 1) {
    
    for (i in 1:(length(p) - 1)) {
      for (j in (i + 1):length(p)) {
        
        sum_pair <- sum_pair + (p[i]^2 * p[j]^2)
        
      }
    }
  }
  
  PIC <- 1 - sum(p^2) - 2 * sum_pair
  
  # Probability of Identity (PID). Paetkau et al. (1995)
  
  PID <- 2 * (sum(p^2)^2) - sum(p^4)
  
  # Results
  
  data.frame(
    n   = n,
    A   = A,
    AE  = AE,
    HO  = HO,
    HE  = HE,
    FIS = FIS,
    PIC = PIC,
    PID = PID
  )
}

# STATISTICS FOR EACH LOCUS

results <- data.frame()

for (i in seq_along(loci)) {
  
  # First allele column for locus i
  col1 <- 3 + (i - 1) * 2
  
  # Second allele column
  col2 <- col1 + 1
  
  stats <- calc_stats(
    datoscr[[col1]],
    datoscr[[col2]]
  )
  
  stats$Locus <- loci[i]
  
  results <- rbind(results, stats)
}

# REORDER COLUMNS

resultscr <- results[
  ,
  c(
    "Locus",
    "n",
    "A",
    "AE",
    "HO",
    "HE",
    "FIS",
    "PIC",
    "PID"
  )
]

# ROUND VALUES FOR TABLE

resultscr$AE  <- round(results$AE, 3)
resultscr$HO  <- round(results$HO, 3)
resultscr$HE  <- round(results$HE, 3)
resultscr$FIS <- round(results$FIS, 3)
resultscr$PIC <- round(results$PIC, 3)
resultscr$PID <- round(results$PID, 4)

# ADD SPECIES NAME

resultscr$Species <- species_name

resultscr <- resultscr[
  ,
  c(
    "Species",
    "Locus",
    "n",
    "A",
    "AE",
    "HO",
    "HE",
    "FIS",
    "PIC",
    "PID"
  )
]

# VIEW RESULTS

print(resultscr)

# EXPORT RESULTS TO EXCEL

write_xlsx(
  results,
  "microsatellite_results_R_cruzi.xlsx"
)


##%######################################################%##
#                                                          #
####                   I. capreolus                     ####
#                                                          #
##%######################################################%##


species_name <- "Ischnura capreolus"

file_name <- "capreolus_genAlex.xlsx"

datoscap <- read_excel(file_name, col_names = FALSE)

head(datoscap)

population_name <- "I. capreolus"

# Convert to standard data frame
datoscap <- as.data.frame(datoscap)

# Keep only rows corresponding to I. capreolus
datoscap <- datoscap[
  !is.na(datoscap[[2]]) &
    datoscap[[2]] == population_name,
]

# Check retained individuals
datoscap[, 1:2]

# Check number of individuals
nrow(datoscap)

# Define loci

loci <- c(
  "Icacy-001",
  "Icacy-002",
  "Icacy-003",
  "Icacy-004",
  "Icacy-006",
  "Icacy-007",
  "Icacy-008",
  "Icacy-009",
  "Icacy-010",
  "Icacy-011",
  "Icacy-012",
  "Icacy-013",
  "Icacy-014",
  "Icacy-017",
  "Icacy-018",
  "Icacy-020",
  "Icacy-022",
  "Icacy-024"
)

######### VALIDATE GENALEX RESULTS IN R FOR I. capreolus ###############

# CALCULATE GENETIC DIVERSITY STATISTICS

calc_stats <- function(a1, a2) {
  
  # Convert allele columns to numeric
  a1 <- as.numeric(a1)
  a2 <- as.numeric(a2)
  
  # A genotype is valid only when BOTH alleles are present and different from zero
  valid <- !is.na(a1) & !is.na(a2) & a1 != 0 & a2 != 0
  
  a1 <- a1[valid]
  a2 <- a2[valid]
  
  # Number of successfully genotyped individuals
  n <- length(a1)
  
  # If no valid genotypes are available
  if (n == 0) {
    
    return(data.frame(
      n   = 0,
      A   = NA,
      AE  = NA,
      HO  = NA,
      HE  = NA,
      FIS = NA,
      PIC = NA,
      PID = NA
    ))
  }
  
  # Allele frequencies
  
  alleles <- c(a1, a2)
  
  freq <- table(alleles) / length(alleles)
  
  p <- as.numeric(freq)
  
  #  Number of alleles (A)
  
  A <- length(p)
  
  # Effective number of alleles (AE)

  AE <- 1 / sum(p^2)
  
  #  Observed heterozygosity (HO)
  
  HO <- sum(a1 != a2) / n
  
  #  Expected heterozygosity (HE)
  
  HE <- 1 - sum(p^2)
  
  # Fixation index (FIS)
  # FIS cannot be calculated when HE = 0
  # (monomorphic locus)
  
  if (HE == 0) {
    FIS <- NA
  } else {
    FIS <- 1 - (HO / HE)
  }
  
####################### PIC AND PID FOR I. capreolus ##########
  
  # Polymorphism Information Content (PIC). Botstein et al. (1980)
  
  sum_pair <- 0
  
  if (length(p) > 1) {
    
    for (i in 1:(length(p) - 1)) {
      for (j in (i + 1):length(p)) {
        
        sum_pair <- sum_pair + (p[i]^2 * p[j]^2)
        
      }
    }
  }
  
  PIC <- 1 - sum(p^2) - 2 * sum_pair
  
  # Probability of Identity (PID). Paetkau et al. (1995)
  
  PID <- 2 * (sum(p^2)^2) - sum(p^4)
  
  # Results
  
  data.frame(
    n   = n,
    A   = A,
    AE  = AE,
    HO  = HO,
    HE  = HE,
    FIS = FIS,
    PIC = PIC,
    PID = PID
  )
}

# STATISTICS FOR EACH LOCUS

results <- data.frame()

for (i in seq_along(loci)) {
  
  # First allele column for locus i
  col1 <- 3 + (i - 1) * 2
  
  # Second allele column
  col2 <- col1 + 1
  
  stats <- calc_stats(
    datoscap[[col1]],
    datoscap[[col2]]
  )
  
  stats$Locus <- loci[i]
  
  results <- rbind(results, stats)
}

#  REORDER COLUMNS

resultscap <- results[
  ,
  c(
    "Locus",
    "n",
    "A",
    "AE",
    "HO",
    "HE",
    "FIS",
    "PIC",
    "PID"
  )
]

#  ROUND VALUES FOR TABLE

resultscap$AE  <- round(results$AE, 3)
resultscap$HO  <- round(results$HO, 3)
resultscap$HE  <- round(results$HE, 3)
resultscap$FIS <- round(results$FIS, 3)
resultscap$PIC <- round(results$PIC, 3)
resultscap$PID <- round(results$PID, 4)

# ADD SPECIES NAME

resultscap$Species <- species_name

resultscap <- resultscap[
  ,
  c(
    "Species",
    "Locus",
    "n",
    "A",
    "AE",
    "HO",
    "HE",
    "FIS",
    "PIC",
    "PID"
  )
]

#  VIEW RESULTS

print(resultscap)

# EXPORT RESULTS TO EXCEL

write_xlsx(
  results,
  "microsatellite_results_R_capreolus.xlsx"
)

##%######################################################%##
#                                                          #
####                   I. cyane                     ####
#                                                          #
##%######################################################%##

species_name <- "Ischnura cyane"

file_name <- "cyane_genAlex.xlsx"

datoscy <- read_excel(file_name, col_names = FALSE)

head(datoscy)

population_name <- "I. cyane"

# Convert to standard data frame
datoscy <- as.data.frame(datoscy)

# Keep only rows corresponding to I. cyane
datoscy <- datoscy[
  !is.na(datoscy[[2]]) &
    datoscy[[2]] == population_name,
]

# Check retained individuals
datoscy[, 1:2]

# Check number of individuals
nrow(datoscy)

# Define loci

loci <- c(
  "Icacy-001",
  "Icacy-002",
  "Icacy-003",
  "Icacy-004",
  "Icacy-005",
  "Icacy-006",
  "Icacy-007",
  "Icacy-008",
  "Icacy-009",
  "Icacy-010",
  "Icacy-011",
  "Icacy-012",
  "Icacy-014",
  "Icacy-015",
  "Icacy-018",
  "Icacy-020",
  "Icacy-022",
  "Icacy-023",
  "Icacy-024",
  "Icacy-026"
)

######### VALIDATE GENALEX RESULTS IN R FOR I. cyane ###############

# CALCULATE GENETIC DIVERSITY STATISTICS

calc_stats <- function(a1, a2) {
  
  # Convert allele columns to numeric
  a1 <- as.numeric(a1)
  a2 <- as.numeric(a2)
  
  # A genotype is valid only when BOTH alleles are present and different from zero
  valid <- !is.na(a1) & !is.na(a2) & a1 != 0 & a2 != 0
  
  a1 <- a1[valid]
  a2 <- a2[valid]
  
  # Number of successfully genotyped individuals
  n <- length(a1)
  
  # If no valid genotypes are available
  if (n == 0) {
    
    return(data.frame(
      n   = 0,
      A   = NA,
      AE  = NA,
      HO  = NA,
      HE  = NA,
      FIS = NA,
      PIC = NA,
      PID = NA
    ))
  }
  
  # Allele frequencies
  
  alleles <- c(a1, a2)
  
  freq <- table(alleles) / length(alleles)
  
  p <- as.numeric(freq)
  
  # Number of alleles (A)
  
  A <- length(p)
  
  # Effective number of alleles (AE)
  
  AE <- 1 / sum(p^2)
  
  # Observed heterozygosity (HO)
  
  HO <- sum(a1 != a2) / n
  
  # Expected heterozygosity (HE)
  
  HE <- 1 - sum(p^2)
  
  # Fixation index (FIS)
  # FIS cannot be calculated when HE = 0
  # (monomorphic locus)
  
  if (HE == 0) {
    FIS <- NA
  } else {
    FIS <- 1 - (HO / HE)
  }
  
  ####################### PIC AND PID FOR I. cyane #############
  
  #  Polymorphism Information Content (PIC). Botstein et al. (1980)
  
  sum_pair <- 0
  
  if (length(p) > 1) {
    
    for (i in 1:(length(p) - 1)) {
      for (j in (i + 1):length(p)) {
        
        sum_pair <- sum_pair + (p[i]^2 * p[j]^2)
        
      }
    }
  }
  
  PIC <- 1 - sum(p^2) - 2 * sum_pair
  
  # Probability of Identity (PID). Paetkau et al. (1995)
  
  PID <- 2 * (sum(p^2)^2) - sum(p^4)
  
  # Results
  
  data.frame(
    n   = n,
    A   = A,
    AE  = AE,
    HO  = HO,
    HE  = HE,
    FIS = FIS,
    PIC = PIC,
    PID = PID
  )
}

#  STATISTICS FOR EACH LOCUS

results <- data.frame()

for (i in seq_along(loci)) {
  
  # First allele column for locus i
  col1 <- 3 + (i - 1) * 2
  
  # Second allele column
  col2 <- col1 + 1
  
  stats <- calc_stats(
    datoscy[[col1]],
    datoscy[[col2]]
  )
  
  stats$Locus <- loci[i]
  
  results <- rbind(results, stats)
}

# REORDER COLUMNS

resultscy <- results[
  ,
  c(
    "Locus",
    "n",
    "A",
    "AE",
    "HO",
    "HE",
    "FIS",
    "PIC",
    "PID"
  )
]

# ROUND VALUES FOR TABLE

resultscy$AE  <- round(results$AE, 3)
resultscy$HO  <- round(results$HO, 3)
resultscy$HE  <- round(results$HE, 3)
resultscy$FIS <- round(results$FIS, 3)
resultscy$PIC <- round(results$PIC, 3)
resultscy$PID <- round(results$PID, 4)

# ADD SPECIES NAME

resultscy$Species <- species_name

resultscy <- resultscy[
  ,
  c(
    "Species",
    "Locus",
    "n",
    "A",
    "AE",
    "HO",
    "HE",
    "FIS",
    "PIC",
    "PID"
  )
]

# VIEW RESULTS

print(resultscy)

# EXPORT RESULTS TO EXCEL

write_xlsx(
  results,
  "microsatellite_results_R_cyanes.xlsx"
)


##%######################################################%##
#                                                          #
####                   Ischnura sp. "a"                     ####
#                                                          #
##%######################################################%##


species_name <- "Ischnura sp. a"

file_name <- "spa_genAlex.xlsx"

datospa <- read_excel(file_name, col_names = FALSE)

head(datospa)

population_name <- "I. spa"

# Convert to standard data frame
datospa <- as.data.frame(datospa)

# Keep only rows corresponding to I. sp. a
datospa <- datospa[
  !is.na(datospa[[2]]) &
    datospa[[2]] == population_name,
]

# Check retained individuals
datospa[, 1:2]

# Check number of individuals
nrow(datospa)


# Define loci

loci <- c(
  "Icacy-001",
  "Icacy-002",
  "Icacy-003",
  "Icacy-004",
  "Icacy-006",
  "Icacy-007",
  "Icacy-008",
  "Icacy-009",
  "Icacy-010",
  "Icacy-011",
  "Icacy-012",
  "Icacy-013",
  "Icacy-014",
  "Icacy-015",
  "Icacy-017",
  "Icacy-018",
  "Icacy-022",
  "Icacy-026"
)


######### VALIDATE GENALEX RESULTS IN R FOR I. sp. a ###############

# CALCULATE GENETIC DIVERSITY STATISTICS

calc_stats <- function(a1, a2) {
  
  # Convert allele columns to numeric
  a1 <- as.numeric(a1)
  a2 <- as.numeric(a2)
  
  # A genotype is valid only when BOTH alleles are present and different from zero
  valid <- !is.na(a1) & !is.na(a2) & a1 != 0 & a2 != 0
  
  a1 <- a1[valid]
  a2 <- a2[valid]
  
  # Number of successfully genotyped individuals
  n <- length(a1)
  
  # If no valid genotypes are available
  if (n == 0) {
    
    return(data.frame(
      n   = 0,
      A   = NA,
      AE  = NA,
      HO  = NA,
      HE  = NA,
      FIS = NA,
      PIC = NA,
      PID = NA
    ))
  }
  
  # Allele frequencies
  
  alleles <- c(a1, a2)
  
  freq <- table(alleles) / length(alleles)
  
  p <- as.numeric(freq)
  
  # Number of alleles (A)

  A <- length(p)
  
  # Effective number of alleles (AE)
  
  AE <- 1 / sum(p^2)
  
  # Observed heterozygosity (HO)
  
  HO <- sum(a1 != a2) / n
  
  #  Expected heterozygosity (HE)
  
  HE <- 1 - sum(p^2)
  
  # Fixation index (FIS)
  # FIS cannot be calculated when HE = 0
  # (monomorphic locus)
  
  if (HE == 0) {
    FIS <- NA
  } else {
    FIS <- 1 - (HO / HE)
  }
  
  
  ############## PIC AND PID FOR I. sp. a
  
  # Polymorphism Information Content (PIC). Botstein et al. (1980)
  
  sum_pair <- 0
  
  if (length(p) > 1) {
    
    for (i in 1:(length(p) - 1)) {
      for (j in (i + 1):length(p)) {
        
        sum_pair <- sum_pair + (p[i]^2 * p[j]^2)
        
      }
    }
  }
  
  PIC <- 1 - sum(p^2) - 2 * sum_pair
  
  # Probability of Identity (PID). Paetkau et al. (1995)
 
  PID <- 2 * (sum(p^2)^2) - sum(p^4)
  
  
  # Results
  
  data.frame(
    n   = n,
    A   = A,
    AE  = AE,
    HO  = HO,
    HE  = HE,
    FIS = FIS,
    PIC = PIC,
    PID = PID
  )
}

# CALCULATE STATISTICS FOR EACH LOCUS

results <- data.frame()

for (i in seq_along(loci)) {
  
  # First allele column for locus i
  col1 <- 3 + (i - 1) * 2
  
  # Second allele column
  col2 <- col1 + 1
  
  stats <- calc_stats(
    datospa[[col1]],
    datospa[[col2]]
  )
  
  stats$Locus <- loci[i]
  
  results <- rbind(results, stats)
}

#REORDER COLUMNS

resultspa <- results[
  ,
  c(
    "Locus",
    "n",
    "A",
    "AE",
    "HO",
    "HE",
    "FIS",
    "PIC",
    "PID"
  )
]

# ROUND VALUES FOR TABLE

resultspa$AE  <- round(results$AE, 3)
resultspa$HO  <- round(results$HO, 3)
resultspa$HE  <- round(results$HE, 3)
resultspa$FIS <- round(results$FIS, 3)
resultspa$PIC <- round(results$PIC, 3)
resultspa$PID <- round(results$PID, 4)

# ADD SPECIES NAME

resultspa$Species <- species_name

resultspa <- resultspa[
  ,
  c(
    "Species",
    "Locus",
    "n",
    "A",
    "AE",
    "HO",
    "HE",
    "FIS",
    "PIC",
    "PID"
  )
]

# VIEW RESULTS

print(resultspa)

# EXPORT RESULTS TO EXCEL

write_xlsx(
  results,
  "microsatellite_results_R_spa.xlsx"
)

