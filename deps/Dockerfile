FROM recetox/aplcms:6.6.6-recetox1

RUN apt-get update && apt-get install -yq \
    libxml2-dev \
    libglpk-dev \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*

RUN Rscript -e 'install.packages(c("XML", "R2HTML", "doSNOW"))'
RUN Rscript -e 'BiocManager::install(c("xcms","sva","WGCNA","mixOmics"), ask=FALSE, update=FALSE)'