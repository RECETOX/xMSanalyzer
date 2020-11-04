FROM hechth/xmsanalyzer-deps:latest

ADD /src /xMSanalyzer

RUN R CMD INSTALL /xMSanalyzer \
 && rm -rf /xMSanalyzer