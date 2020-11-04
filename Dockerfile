FROM recetox/xmsanalyzer:2.0.6.1-deps

ADD /src /xMSanalyzer

RUN R CMD INSTALL /xMSanalyzer \
 && rm -rf /xMSanalyzer