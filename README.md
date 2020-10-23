# xMSanalyzer

This is a fork of [kuppal2/xMSanalyzer](https://github.com/kuppal2/xMSanalyzer) which extends the initial functionality by providing a Dockerfile to containerize the functionality.

## Dockerfile
The [base docker image](https://hub.docker.com/r/recetox/aplcms/tags) is a containerized version of [apLCMS](https://github.com/tianwei-yu/apLCMS).
Additional layers install the dependencies for xMSanalyzer from [CRAN](https://cran.r-project.org/) and [bioconductor](https://bioconductor.org/).