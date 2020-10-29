evaluate.Features <- function(
                              curdata,
                              numreplicates,
                              min.samp.percent = 0.6,
                              alignment.tool,
                              impute.bool,
                              missingvalue = 0) {
  if (numreplicates == 2) {
    print("**calculating percent intensity difference**")
    eval.feat.results <- apLCMS::getPID(curdata, alignment.tool, missingvalue, numreplicates)
  }
  else {
    if (numreplicates > 2) {
      print("**calculating CV**")
      eval.feat.results <- apLCMS::getCVreplicates(curdata, alignment.tool, min.samp.percent = 0.6, numreplicates, impute.bool, missingvalue)
    }
  }
  return(eval.feat.results)
}