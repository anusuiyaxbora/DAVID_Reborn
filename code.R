#Reading gene list

geneList <- read.csv("PMC6587650.csv")

#view file structure
str(geneList) 

#input background list

#GO set

#if (!require("BiocManager", quietly = TRUE))
#  install.packages("BiocManager")
#BiocManager::install(version = "3.18")
#BiocManager::install(c("GO.db"))

##Gene Ontology Results
if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("GO.db")

  ## Reading GAF File
gafFile <- system.file(
  package = "BaseSet", "extdata",
  "goa_human.gaf.gz")
# readGAF(goa_human.gaf.gz, evidence=NULL, aspect=c("P", "F", "C"))
gs <- getGAF(gafFile)
head(gs)

#ClusterProfiler
if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("clusterProfiler")

BiocManager::install("AnnotationDbi")
BiocManager::install("org.Hs.eg.db")

clusterProfiler::gseGO(
  geneList,
  ont = "BP",
  OrgDb = "Homo sapiens",
  keyType = "GENEID",
  exponent = 1,
  minGSSize = 10,
  maxGSSize = 500,
  eps = 1e-10,
  pvalueCutoff = 0.05,
  pAdjustMethod = "BH",
  verbose = TRUE,
  seed = FALSE,
  by = "fgsea",
)


## select.list(GOTERM)

input_genes <- as.list(GOTERM)
if(length(input_genes) > 0){
  # Get the TERMS for the first elent of xx
  GOID(input_genes[[1]])
  Term(input_genes[[1]])
  Synonym(input_genes[[1]])
  Secondary(input_genes[[1]])
  Definition(input_genes[[1]])
  Ontology(input_genes[[1]])
}

# P-value
# FDR Correction

#Checking for annotations?