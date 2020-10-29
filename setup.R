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

    data(example_target_list_pos)
    data(example_target_list_neg)

    # Init global variables

    # cdfloc = cdfloc,
    #         apLCMS.outloc = apLCMS_outloc,
    #         xMSanalyzer.outloc = xMSanalyzer_outloc,
    #         min.run.list = c(4, 3),
    #         min.pres.list = c(0.5, 0.8),
    #         minexp.pct = 0.1,
    #         mztol = 10e-4,
    #         alignmztol = 10e-5,
    #         alignchrtol = 10,
    #         numnodes = num_nodes,
    #         apLCMSmode = "untargeted",
    #         known_table = NA,
    #         match_tol_ppm = NA,
    #         run.order.file = NA,
    #         max.mz.diff = 15,
    #         max.rt.diff = 300,
    #         merge.eval.pvalue = 0.05,
    #         mergecorthresh = 0.7,
    #         deltamzminmax.tol = 30,
    #         subs = NA,
    #         num_replicates = num_replicates,
    #         mz.tolerance.dbmatch = 10,
    #         adduct.list = NA,
    #         samp.filt.thresh = 0.1,
    #         feat.filt.thresh = 30,
    #         cormethod = "spearman",
    #         mult.test.cor = FALSE,
    #         missingvalue = 0,
    #         ignore.missing = TRUE,
    #         filepattern = ".mzML",
    #         sample_info_file = sample_info_file,
    #         refMZ = reference_chemicals_file,
    #         refMZ.mz.diff = 10,
    #         refMZ.time.diff = NA,
    #         void.vol.timethresh = 30,
    #         replacezeroswithNA = TRUE,
    #         charge_type = charge_type,
    #         syssleep = 0.1
}