FROM alpine:latest
LABEL maintainer="Professor Daehn <jdaehn@missouristate.edu>"
LABEL Description="This image is used to check program correctness for various assignments in CSC232"
LABEL Semester="Spring 2020"
LABEL Course="CSC232"
LABEL Version="2020.04.14"
RUN apk add bash g++ make cmake git doxygen graphviz
RUN mkdir /project && mkdir /generator
