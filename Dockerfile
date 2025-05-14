# build from ubuntu
FROM ubuntu:22.04

# set path for the FOP installation
ENV PATH "$PATH:/usr/local/fop-2.9/fop"

# update lists of packages
RUN apt-get update

# install the latest version of OpenJRE
RUN apt-get install -y default-jre

# install wget
RUN apt-get install -y wget

# get the version 2.9 of FOP
RUN wget https://archive.apache.org/dist/xmlgraphics/fop/binaries/fop-2.9-bin.tar.gz

# unpack FOP into /usr/local
RUN tar -xvzf fop-2.9-bin.tar.gz -C /usr/local

COPY fonts /usr/local/lib
COPY conf /usr/local/
WORKDIR /work

# entrypoint 
ENTRYPOINT ["fop", "-c", "/usr/local/fop.xconf"]

# default command will print the current version of FOP
CMD ["-version"]
