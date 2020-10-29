get_num_columns <- function(alignment_tool) {
  if (alignment_tool == "apLCMS") {
    col_end <- 4
  }
  else {
    if (alignment_tool == "XCMS") {
      col_end <- 8
    }
    else {
      col_end <- 2
    }
  }
  return(col_end)
}

do_something <- function(r, num_samples, curdata, missingvalue) {
    newrow <- {}
    finalmat <- {}
    no_value <- 0
    goodsamps <- 0
    for (samp in seq(1, (num_samples), 2))
    {
      i <- samp
      j <- i + 1
      int1 <- curdata[r, i]
      int2 <- curdata[r, j]

      curdata_int <- curdata[r, c(i:j)]
      if (is.na(missingvalue) == TRUE) {
        check_zeros <- which(is.na(curdata_int) == TRUE)
      } else {
        check_zeros <- which(curdata_int == missingvalue)
      }

      if (length(check_zeros) > 0) {
        replicate_diff <- NA
        no_value <- no_value + 1
      }
      else {
        # calculate PID
        replicate_diff <- 100 * (abs(int1 - int2) / mean(c(int1, int2)))
        goodsamps <- goodsamps + 1
      }
      newrow <- cbind(newrow, replicate_diff)
    }

    # get indices of the PIDs that are NA
    na_ind <- which(is.na(newrow) == TRUE)

    # get quantile summary of the percent intensity difference (PID) vector
    # using only the non-NA values
    if (length(na_ind) > 0) {
      sumrow <- summary(as.vector(newrow[-na_ind]))
    }
    else {
      sumrow <- summary(as.vector(newrow))
    }

    # if quantile values are set  to NA
    if (length(sumrow) < 6) {
      for (i in 1:6)
      {
        sumrow[i] <- 200
      }
    }
    names(sumrow) <- c("min", "first_quartile", "median", "mean", "third_quartile", "max")


    finalmat <- rbind(finalmat, c(unlist(sumrow), goodsamps))
    return(finalmat)
  }

getPID <- function(
                   curdata,
                   alignment_tool,
                   missingvalue,
                   numreplicates) {

  col_end <- get_num_columns(alignment_tool)
  sprintf("**Using the first %s columns as mz and retention time for PID calculation**", col_end)

  curdata_mz_rt_info <- curdata[, c(1:col_end)]
  curdata <- curdata[, -c(1:col_end)]

  numfeats <- dim(curdata)[1]
  numsamp <- dim(curdata)[2]

  maxint <- apply(curdata, 1, function(x) {
    max(x, na.rm = TRUE)
  })

  maxint <- log(maxint, 10)
  resvec_1 <- lapply(1:numfeats, function(r) {
    do_something(r, numsamp, curdata, missingvalue)
  })

  final_set <- {}
  for (i in 1:length(resvec_1)) {
    if (length(resvec_1[[i]]) > 1) {
      final_set <- rbind(final_set, resvec_1[[i]])
    }
  }

  final_set <- as.data.frame(final_set)
  rownames(final_set) <- NULL
  final_set <- apply(final_set, 2, as.numeric)
  final_set <- as.data.frame(final_set)

  colnames(final_set) <- c("min", "first_quartile", "median", "mean", "third_quartile", "max", "numgoodsamples")

  numsamp <- numsamp / 2

  mz_min_max <- cbind(curdata_mz_rt_info[, 1], curdata_mz_rt_info[, 1])
  if (alignment_tool == "apLCMS") {
    mz_min_max <- cbind(curdata_mz_rt_info[, 3], curdata_mz_rt_info[, 4])
  } else {
    if (alignment_tool == "XCMS") {
      mz_min_max <- cbind(curdata_mz_rt_info[, 2], curdata_mz_rt_info[, 3])
    }
  }
  mz_min_max <- as.data.frame(mz_min_max)

  if (is.na(missingvalue) == TRUE) {
    num_tot_nonzeros <- apply(curdata, 1, function(x) {
      length(which(is.na(x) == FALSE))
    })
  } else {
    num_tot_nonzeros <- apply(curdata, 1, function(x) {
      length(which(x > missingvalue))
    })
  }

  # part of xMSanalyzer_v2.0.6
  termA <- final_set$median + 0.01 + 1
  termB <- num_tot_nonzeros * (1 / numreplicates)

  Qscore <- (100 * final_set$numgoodsamples) / ((termA * termB) + 0.01)

  final_set <- cbind(final_set, Qscore)
  final_set <- as.data.frame(final_set)
  return(final_set)
}