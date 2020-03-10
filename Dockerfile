
FROM alpine:3.9.2

RUN apk add texlive-full

CMD ["/bin/sh", "-c", "cd /opt/spec && ./compile sbol3"]

