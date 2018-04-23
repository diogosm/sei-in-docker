# pra rodar: sudo docker run -d -p 3306:3306 -e MYSQL_ALLOW_EMPTY_PASSWORD=yes mysq
FROM mariadb:5.5

ENV MYSQL_ALLOW_EMPTY_PASSWORD="yes"

# copia sqls
COPY sip_3_0_0_BD_Ref_Exec.sql /tmp/
COPY sei_3_0_0_BD_Ref_Exec.sql /tmp/
#COPY my.cnf /etc/my.cnf
COPY install.sh /install.sh

RUN chmod a+x /install.sh

#RUN usermod -u 1000 mysql
#RUN sh /install.sh

#EXPOSE 3306


	
