FROM mariadb:5.5

ENV MYSQL_ALLOW_EMPTY_PASSWORD="yes"

# copia sqls
COPY sip_3_0_0_BD_Ref_Exec.sql /tmp/
COPY sei_3_0_0_BD_Ref_Exec.sql /tmp/
#COPY my.cnf /etc/my.cnf
COPY install.sh /docker-entrypoint-initdb.d/install.sh

RUN chmod a+x /docker-entrypoint-initdb.d/install.sh


