FROM openjdk:8
RUN apt-get update && apt-get install -y build-essential maven python-dev
RUN mkdir /var/lib/floodlight && chmod 777 /var/lib/floodlight
EXPOSE 6653 1044 8080
WORKDIR /usr/src/myapp
COPY ENTRYPOINT.sh /
RUN chmod +x /ENTRYPOINT.sh
CMD ["/ENTRYPOINT.sh"]
