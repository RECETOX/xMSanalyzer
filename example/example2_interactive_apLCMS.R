source("xMSanalyzer/setup.R")

data_path <- "C:\\Users\\473355\\Data\\urine_mzml\\data\\20"
source_path <- file.path(getwd(), "xMSanalyzer", "src")
setup(source_path, data_path)

res.list <- xMSwrapper.apLCMS(
    cdfloc = cdfloc,
    apLCMS.outloc = apLCMS.outloc,
    xMSanalyzer.outloc = xMSanalyzer.outloc,
    min.run.list = min.run.list,
    min.pres.list = min.pres.list,
    minexp.pct = minexp.pct,
    mztol = mztol,
    alignmztol = alignmztol,
    alignchrtol = alignchrtol,
    numnodes = numnodes,
    apLCMSmode = apLCMSmode,
    known_table = known_table,
    match_tol_ppm = match_tol_ppm,
    run.order.file = run.order.file,
    max.mz.diff = max.mz.diff,
    max.rt.diff = max.rt.diff,
    merge.eval.pvalue = merge.eval.pvalue,
    mergecorthresh = mergecorthresh,
    deltamzminmax.tol = deltamzminmax.tol,
    subs = subs,
    num_replicates = num_replicates,
    mz.tolerance.dbmatch = mz.tolerance.dbmatch,
    adduct.list = adduct.list,
    samp.filt.thresh = samp.filt.thresh,
    feat.filt.thresh = feat.filt.thresh,
    cormethod = cormethod,
    mult.test.cor = mult.test.cor,
    missingvalue = missingvalue,
    ignore.missing = ignore.missing,
    filepattern = filepattern,
    sample_info_file = sample_info_file,
    refMZ = refMZ,
    refMZ.mz.diff = refMZ.mz.diff,
    refMZ.time.diff = refMZ.time.diff,
    void.vol.timethresh = void.vol.timethresh,
    replacezeroswithNA = replacezeroswithNA,
    charge_type = charge_type,
    syssleep = syssleep
)