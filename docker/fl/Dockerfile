FROM openjdk:8
RUN apt-get update && apt-get install -y build-essential ant maven python-dev
COPY installOracleJdk8.sh /
RUN mkdir /var/lib/floodlight && chmod 777 /var/lib/floodlight && chmod +x /installOracleJdk8.sh
EXPOSE 6653 1044 8080
WORKDIR /usr/src/myapp
COPY ENTRYPOINT.sh /
RUN chmod +x /ENTRYPOINT.sh
CMD ["/ENTRYPOINT.sh"]
