#!/bin/bash

set -e

#rm -rf /var/lib/mysql/*
#chown -R mysql:mysql /var/lib/mysql
#mysql_install_db --user=mysql --datadir="/var/lib/mysql" --rpm

#mysqld_safe /usr/bin/mysqld_safe --bind-address=0.0.0.0
#mysql_install_db --user=root --datadir="/var/lib/mysql" --rpm
#mysql_install_db --user=mysql --datadir="/var/lib/mysql" --rpm

#/etc/init.d/mysql start

# Criação dos bancos de dados do sistema
#mysqladmin create sip
#mysqladmin create sei

## base já existe
DBNAME="sip"
DBEXISTS=$(mysql --batch --skip-column-names -e "SHOW DATABASES LIKE '"$DBNAME"';" | grep "$DBNAME" > /dev/null; echo "$?")

if [ $DBEXISTS -eq 0 ];then
	echo "A database with the name $DBNAME already exists."
else
	echo " database $DBNAME does not exist. Creating..."
	mysql -u root -e "create database sei"; 
	mysql -u root -e "create database sip"; 

	# Criação dos usuários utilizados na conexão com SEI e SIP
	mysql -u root -e "CREATE USER 'sip_user'@'%' IDENTIFIED BY 'sip_user'" sip
	mysql -u root -e "CREATE USER 'sei_user'@'%' IDENTIFIED BY 'sei_user'" sei
	mysql -u root -e "GRANT ALL PRIVILEGES ON sip.* TO 'sip_user'@'%'" sip
	mysql -u root -e "GRANT ALL PRIVILEGES ON sei.* TO 'sei_user'@'%'" sei

	# Restauração dos bancos de dados
	mysql -u root sei < /tmp/sei_3_0_0_BD_Ref_Exec.sql
	mysql -u root sip < /tmp/sip_3_0_0_BD_Ref_Exec.sql

	# Atualização dos parâmetros do SEI e do SIP
	mysql -u root -e "update orgao set sigla='ABC', descricao='ORGAO ABC' where id_orgao=0;" sip
	mysql -u root -e "update sistema set pagina_inicial='http://localhost/sip' where sigla='SIP';" sip
	mysql -u root -e "update sistema set pagina_inicial='http://localhost/sei/inicializar.php', web_service='http://localhost/sei/controlador_ws.php?servico=sip' where sigla='SEI';" sip
	mysql -u root -e "update orgao set sigla='ABC', descricao='ORGAO ABC' where id_orgao=0;" sei

	# Remove registros de auditoria presentes na base de referência
	mysql -u root -e "delete from auditoria_protocolo;" sei

	# Configuração para utilizar autenticação nativa do SEI/SIP
	mysql -u root -e "update orgao set sin_autenticar='N' where id_orgao=0;" sip

	rm -rf /tmp/*

fi

# Atribuição de permissões de acesso externo para o usuário root, senha root
#mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'root' WITH GRANT OPTION;"

exit 0
