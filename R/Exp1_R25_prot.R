
#' @title Builds Exp1_R25_prot dataset
#' 
#' @rdname Exp1_R25_prot
#' @examples 
#' builds_Exp1_R25_prot()
#' 
#' @importFrom utils read.table
#' 

builds_Exp1_R25_prot <- function(){
  
  if (! requireNamespace("DAPAR", quietly = TRUE)) {
    stop("Please install DAPAR: BiocManager::install('DAPAR')")
  }
  
  exprsFile <- system.file(
    "extdata", 
    "Exp1_R25_prot.txt", 
    package = "DAPARdata"
    )

metadataFile <- system.file(
  "extdata", 
  "samples_Exp1_R25.txt", 
  package = "DAPARdata"
  )

metadata = read.table(
  metadataFile, 
  header = TRUE, 
  sep = "\t", 
  as.is = TRUE
  )

Exp1_R25_prot <- NULL
Exp1_R25_prot <- DAPAR::createMSnset(
  file = exprsFile, 
  metadata = metadata, 
  indExpData = seq.int(from = 49, to = 54), 
  colnameForID = 'id', 
  indexForMetacell = seq.int(from = 36, to = 41),
  logData = TRUE, 
  replaceZeros = TRUE,
  pep_prot_data = "protein",
  proteinId = "Protein_IDs",
  software = 'maxquant'
  )

Exp1_R25_prot

}