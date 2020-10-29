setup <- function(source_dir) {
    library(XML)
    library(R2HTML)
    library(limma)
    library(RCurl)
    library(rgl)
    library(doSNOW)
    library(mzR)
    library(foreach)
    library(sva)
    library(mixOmics)
    library(WGCNA)
    library(apLCMS)
    library(xcms)

    setwd(source_dir)

    files <- list.files(pattern = "*.R")
    lapply(files, source)
}