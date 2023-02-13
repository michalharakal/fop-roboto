Roboto fonts with fop
================================
The aim of this small project is to help to use of roboto fonts in documents rendered by FOP.
It consists from:

 * roboto ttf included
 * created metrics files for TTF
 * configuration file for using embeded fonts

What is roboto
-------------------------
Roboto is a typeface introduced with Android 4.0 Ice Cream Sandwich [see article on wikipedia](http://en.wikipedia.org/wiki/Roboto).

What is FOP
-------------------------
FOP (Formatting Objects Processor) is a in java written print formatter driven by XSL formatting objects (XSL-FO) 
and an output independent formatter. It reads a formatting object (FO) tree and renders the resulting pages to 
a specified output.

I'm using it for renedring of PDF documents from various sources (DocBook and custom).

Motivation using roboto fonts in PDFs
-------------------------
Roboto is typeface optimized to look great on devices with high dencities but on paper it looks also great.
And for me as an Android developer a natural selection for custom fonts ;-)


Implementation details
-------------------------
It is no rocket science to use embeded fonts with FOP. Its [well documented](http://xmlgraphics.apache.org/fop/trunk/fonts.html#embedding)
and actually consins from two steps:

 * create metrics files for True Type Fonts
 * provide and configure fonts for use with FOP
  
Use
-------------------------

  fop/fop -c fop/conf/fop.xconf simple.fo simple.pdf


## FOP in Docker

This Docker image wraps version 2.8 of **apache-fop** inckusive embedded Roboto fonts with proper roboto configuration and inclusive **Java runtime environment** so it can be executed as transparent command line tool even on machines without installed Java.

### Docker Image

The image uses the official [adoptopenjdk/openjdk11:alpine](https://hub.docker.com/r/adoptopenjdk/openjdk11/) image
for building a distribution of fop and 
https://hub.docker.com/r/adoptopenjdk/openjdk11/[adoptopenjdk/openjdk11:alpine-jre] for runtime.

## Build

You can build docker image from source code locally. 

    git clone https://github.com/michalharakal/fop-roboto.git
    docker build -t roboto-fop .    


## Run

For security reasons is **Apache-Fop Docker image** designed to run in the current folder only, so a container doesn't have any access to any other folders on a host system. Since this is a transparent call of Docker image from command line, where new files are generated, it is also a good idea to execute code inside a Docker as a non root user and match it to the host caller.

Calling a dockerized image can look like this:

```shell
docker run --rm -u $(id -u ${USER}):$(id -g ${USER}) -v `pwd`:/work roboto-fop simple.fo simple.pdf
```

## Integration as alias

      alias antlr4='docker run --rm -u $(id -u ${USER}):$(id -g ${USER}) -v `pwd`:/work roboto-fop $@'

## Licence

### Apache FOP

**Apache Fop** is deistrubuted under Apache Licence version 2.0 https://xmlgraphics.apache.org/fop/license.html

### Roboto font

Roboto Font was created by Google(TM), https://fonts.google.com/specimen/Roboto#license and is Licensed under Apache 2.0 license.

