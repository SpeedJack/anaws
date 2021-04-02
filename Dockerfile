FROM openjdk:7
FROM webratio/ant
FROM iwaseyusuke/mininet
COPY . /usr/src/myapp
WORKDIR /usr/src/myapp
