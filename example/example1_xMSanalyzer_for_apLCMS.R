
library(xMSanalyzer)
# please see the manual for description of functions and parameters



data(example_target_list_pos)
data(example_target_list_neg)
### Input parameters###########

# 1) cdfloc: The folder where all CDF files to be processed are located. For example "C:/CDF/"
# Note: set cdfloc=NA if the cdf files are already aligned using apLCMS and the results
# exist in apLCMS.outloc

cdfloc <- "C:\\Users\\473355\\Data\\urine_mzml\\data\\20"

# Note: Feature table at each individual parameter setting (just like apLCMS)
# 2) apLCMS.outloc: The folder where alignment output will be written. For example "C:/CDFoutput/"

apLCMSoutloc <- "C:\\Users\\473355\\Data\\apLCMS_out"


# Note: Merged feature table (like apLCMS, but with feature quality summary)
# 3) xMSanalyzer.outloc: The folder where xMSanalyzer output will be written. For example "C:/xMSanalyzeroutput/"
xMSanalyzeroutloc <- "C:\\Users\\473355\\Data\\xmsAnalyzer_out"



# 4) Sequence file path; Need for batch-effect evaluation; eg: "C:/Documents/Projects/pos/sequence_file_pos.txt"
# Column A: Names matching .cdf or .mzXML files
# Column B: Sample ID/name
# Column C: Batch (column should be labeled "Batch")

sample_info_file <- NA # "/Users/Documents/Projects/sequence_file_pos.txt"

# 5) reference chemicals; use NA for the example_target_list provided with the package
# eg:"C:/Documents/Emory/JonesLab/Projects/xMSanalyzer/valid_chem_mz.txt"
reference_chemicals_file <- NA # "/Users/Documents/Projects/xMSanalyzer/pos_mode_target_mz_list_M+H.txt"


# 6) Ionization mode: use "pos" for positive; use "neg" for negative
charge_type <- "pos"

# 7) Other parameters
num_nodes <- 8
num_replicates <- 1

######################################### END of Input parameters##########################################################

######## xMSanalyzer usage##################


result <- try({
      par(mfrow = c(2, 2))
      pdf("Rplots.pdf")
      res.list <- xMSwrapper.apLCMS(
            cdfloc = cdfloc,
            apLCMS.outloc = apLCMSoutloc,
            xMSanalyzer.outloc = xMSanalyzeroutloc,
            min.run.list = c(4, 3),
            min.pres.list = c(0.5, 0.8),
            minexp.pct = 0.1,
            mztol = 10e-6,
            alignmztol = 10e-6,
            alignchrtol = 10,
            numnodes = num_nodes,
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
            num_replicates = num_replicates,
            mz.tolerance.dbmatch = 10,
            adduct.list = NA,
            samp.filt.thresh = 0.1,
            feat.filt.thresh = 30,
            cormethod = "spearman",
            mult.test.cor = FALSE,
            missingvalue = 0,
            ignore.missing = TRUE,
            filepattern = ".mzML",
            sample_info_file = sample_info_file,
            refMZ = reference_chemicals_file,
            refMZ.mz.diff = 10,
            refMZ.time.diff = NA,
            void.vol.timethresh = 30,
            replacezeroswithNA = TRUE,
            charge_type = charge_type,
            syssleep = 0.1
      )

      dev.off()
      setwd(xMSanalyzeroutloc)
      save(res.list, file = "xMSwrapper_apLCMS.Rda")
})