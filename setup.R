setup <- function(source_dir, path_to_data) {
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

    old_wd <- getwd()

    setwd(file.path(source_dir, "R"))

    files <- list.files(pattern = "*.R")
    lapply(files, source)

    setwd(file.path(source_dir))

    data(example_target_list_pos)
    data(example_target_list_neg)

    # Init global variables

    cdfloc <<- path_to_data
    apLCMS.outloc <<- file.path(cdfloc, "apLCMS_out")
    xMSanalyzer.outloc  <<- file.path(cdfloc, "xMSanalyzer_out")
    min.run.list <<- c(4, 3)
    min.pres.list <<- c(0.5, 0.8)
    minexp.pct <<- 0.1
    mztol <<- 10e-4
    alignmztol <<- 10e-4
    alignchrtol <<- 10
    numnodes <<- 8
    apLCMSmode <<- "untargeted"
    known_table <<- NA
    match_tol_ppm <<- NA
    run.order.file <<- NA
    max.mz.diff <<- 15
    max.rt.diff <<- 300
    merge.eval.pvalue <<- 0.05
    mergecorthresh <<- 0.7
    deltamzminmax.tol <<- 30
    subs <<- NA
    num_replicates <<- 2
    mz.tolerance.dbmatch <<- 10
    adduct.list <<- NA
    samp.filt.thresh <<- 0.1
    feat.filt.thresh <<- 30
    cormethod <<- "spearman"
    mult.test.cor <<- FALSE
    missingvalue <<- 0
    ignore.missing <<- TRUE
    filepattern <<- ".mzML"
    sample_info_file <<- NA
    refMZ <<- NA
    refMZ.mz.diff <<- 10
    refMZ.time.diff <<- NA
    void.vol.timethresh <<- 30
    replacezeroswithNA <<- TRUE
    charge_type <<- "pos"
    syssleep <<- 0.1

    force(cdfloc)
    force(apLCMS.outloc)
    force(xMSanalyzer.outloc)
    force(min.run.list)
    force(min.pres.list)
    force(minexp.pct)
    force(mztol)
    force(alignmztol)
    force(alignchrtol)
    force(numnodes)
    force(apLCMSmode)
    force(known_table)
    force(match_tol_ppm)
    force(run.order.file)
    force(max.mz.diff)
    force(max.rt.diff)
    force(merge.eval.pvalue)
    force(mergecorthresh)
    force(deltamzminmax.tol)
    force(subs)
    force(num_replicates)
    force(mz.tolerance.dbmatch)
    force(adduct.list)
    force(samp.filt.thresh)
    force(feat.filt.thresh)
    force(cormethod)
    force(mult.test.cor)
    force(missingvalue)
    force(ignore.missing)
    force(filepattern)
    force(sample_info_file)
    force(refMZ)
    force(refMZ.mz.diff)
    force(refMZ.time.diff)
    force(void.vol.timethresh)
    force(replacezeroswithNA)
    force(charge_type)
    force(syssleep)
}