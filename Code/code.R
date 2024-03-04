#Reading gene list

input_genes <- read.csv("PMC6587650.csv")

#view file structure
str(input_genes) 

#input background list

#GO set

if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install(version = "3.18")
BiocManager::install(c("GO.db"))

  ## Reading GAF File
gafFile <- system.file(
  package = "BaseSet", "extdata",
  "goa_human.gaf.gz")
# readGAF(goa_human.gaf.gz, evidence=NULL, aspect=c("P", "F", "C"))
gs <- getGAF(gafFile)
head(gs)

# P-value
# FDR Correction

#Checking for annotations?