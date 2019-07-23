FROM tutum/lamp:latest
RUN rm -rf /app
COPY ./xss /app/
COPY ./mysql.sh /app/
RUN bash /app/mysql.sh
EXPOSE 80 3306
CMD ["/run.sh"] 
