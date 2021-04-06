FROM openjdk:7
FROM webratio/ant
EXPOSE 6653 1044 8080
WORKDIR /usr/src/myapp
COPY ENTRYPOINT.sh /
RUN chmod +x /ENTRYPOINT.sh
CMD ["/ENTRYPOINT.sh"]
