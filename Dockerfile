FROM openjdk:7
FROM webratio/ant
EXPOSE 6653
EXPOSE 1044
COPY . /usr/src/myapp
WORKDIR /usr/src/myapp
RUN  ant
CMD ["./floodlight.sh"]
