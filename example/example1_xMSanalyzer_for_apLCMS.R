library(xMSanalyzer)
# please see the manual for description of functions and parameters

data(example_target_list_pos)
data(example_target_list_neg)
### Input parameters###########

# 1) cdfloc: The folder where all CDF files to be processed are located. For example "C:/CDF/"
# Note: set cdfloc=NA if the cdf files are already aligned using apLCMS and the results
# exist in apLCMS.outloc

cdfloc <- "/data"


# Note: Feature table at each individual parameter setting (just like apLCMS)
# 2) apLCMS.outloc: The folder where alignment output will be written. For example "C:/CDFoutput/"

apLCMS_outloc <- "/data/apLCMS_out"


# Note: Merged feature table (like apLCMS, but with feature quality summary)
# 3) xMSanalyzer.outloc: The folder where xMSanalyzer output will be written. For example "C:/xMSanalyzeroutput/"
xMSanalyzer_outloc <- "/data/xmsAnalyzer_out"

dir.create(apLCMS_outloc, showWarnings=FALSE)
dir.create(xMSanalyzer_outloc, showWarnings=FALSE)

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
            num_replicates = 3,
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
      setwd(xMSanalyzeroutloc)
      save(res.list, file = "xMSwrapper_apLCMS.Rda")
})