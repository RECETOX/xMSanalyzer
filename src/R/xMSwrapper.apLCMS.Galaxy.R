xMSwrapper.apLCMS.Galaxy <- function(files) {
    library(xMSanalyzer)

    # Load required ata
    data(example_target_list_pos)
    data(example_target_list_neg)


    cdfloc <- "/tmp"
    apLCMS_outloc <- file.path(cdfloc, "apLCMS_out")
    xMSanalyzer_outloc <- file.path(cdfloc, "xmsAnalyzer_out")

    dir.create(cdfloc)

    lapply(files, function(name) {
        file.copy(name, cdfloc)
    })

    ######## xMSanalyzer usage##################

    options(error = function() traceback(3))
    result <- try({
        par(mfrow = c(2, 2))
        pdf("Rplots.pdf")
        res.list <- xMSwrapper.apLCMS(
            cdfloc = cdfloc,
            apLCMS.outloc = apLCMS_outloc,
            xMSanalyzer.outloc = xMSanalyzer_outloc,
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
            ignore.missing = TRUE,
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

        dev.off()
        setwd(xMSanalyzer_outloc)
        save(res.list, file = "xMSwrapper_apLCMS.Rda")
    })
}