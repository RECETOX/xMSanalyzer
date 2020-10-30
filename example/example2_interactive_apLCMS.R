source("xMSanalyzer/setup.R")

data_path <- "C:\\Users\\473355\\Data\\urine_mzml\\data\\20"
source_path <- file.path(getwd(), "xMSanalyzer", "src")
setup(source_path, data_path)

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