source("xMSanalyzer/setup.R")

data_path <- "C:\\Users\\473355\\Data\\urine_mzml\\data\\40"
source_path <- file.path(getwd(), "xMSanalyzer", "src")
setup(source_path, data_path)

res.list <- xMSwrapper.apLCMS(
    cdfloc = cdfloc,
    apLCMS.outloc = file.path(cdfloc, "apLCMS_out"),
    xMSanalyzer.outloc = file.path(cdfloc, "xMSanalyzer_out"),
    min.run.list = c(4, 3),
    min.pres.list = c(0.5, 0.8),
    minexp.pct = 0.1,
    mztol = 10e-5,
    alignmztol = 10e-5,
    alignchrtol = 10,
    numnodes = parallel::detectCores(),
    apLCMSmode = "untargeted",
    known_table = NA,
    match_tol_ppm = NA,
    run.order.file = NA,
    max.mz.diff = 15,
    max.rt.diff = 300,
    merge.eval.pvalue = 0.05,
    mergecorthresh = 0.7,
    deltamzminmax.tol = 30,
    subs = NA,
    num_replicates = 2,
    mz.tolerance.dbmatch = 10,
    adduct.list = NA,
    samp.filt.thresh = 0.1,
    feat.filt.thresh = 30,
    cormethod = "spearman",
    mult.test.cor = FALSE,
    missingvalue = 0,
    ignore.missing =  TRUE,
    filepattern = ".mzML",
    sample_info_file = NA,
    refMZ = NA,
    refMZ.mz.diff = 10,
    refMZ.time.diff = NA,
    void.vol.timethresh = 30,
    replacezeroswithNA = TRUE,
    charge_type = "pos",
    syssleep = 0.1
)