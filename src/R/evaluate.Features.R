evaluate.Features <- function(
                              curdata,
                              numreplicates,
                              min_samp_percent = 0.6,
                              alignment_tool,
                              impute,
                              missingvalue = 0) {
  if (numreplicates == 2) {
    print("**calculating percent intensity difference**")
    results <- getPID(
      curdata,
      alignment_tool,
      missingvalue,
      numreplicates
    )
  }
  else {
    if (numreplicates > 2) {
      print("**calculating CV**")
      results <- getCVreplicates(
        curdata,
        alignment_tool,
        min_samp_percent = 0.6,
        numreplicates,
        impute,
        missingvalue
      )
    }
  }
  return(results)
}