FROM adoptopenjdk/openjdk11:alpine AS builder

WORKDIR /opt/fop

ARG MAVEN_OPTS="-Xmx1G"

RUN apk add --no-cache maven git curl tree \
    && curl -L https://downloads.apache.org/xmlgraphics/fop/source/fop-2.8-src.tar.gz | tar zxv \
    && cd fop-2.8 \
    && mvn clean -DskipTests install \
    && tree \
    && pwd \
    && ls -la
FROM adoptopenjdk/openjdk11:alpine-jre

RUN apk add --no-cache tree

ARG user=fopuser
ARG group=fopuser
ARG uid=1000
ARG gid=1000

RUN adduser \
    --disabled-password \
    --gecos "" \
    --home "$(pwd)" \
    --no-create-home \
    --uid "${uid}" \
    "${user}"

COPY --from=builder /opt/fop/fop-2.8/fop/ /usr/local/lib/
COPY fonts /usr/local/lib/
COPY conf /usr/local/lib/
WORKDIR /work
RUN tree /usr/local/lib
ENTRYPOINT ["/usr/local/lib/fop", "-c", "/usr/local/lib/fop.xconf"]

