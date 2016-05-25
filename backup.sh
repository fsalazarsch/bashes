 #!/bin/sh
 mysqldump -uroot -ppwd --opt db1.sql > /respaldosql/db1.sql
 mysqldump -uroot -ppwd --opt db2.sql > /respaldosql/db2.sql
 cd /home/usuario/respaldosql/
 tar -zcvf respaldosql_$(date +%d%m%y).tgz *.sql
 find -name '*.tgz' -type f -mtime +2 -exec rm -f {} ;
 
  sudo chmod 700 mysqlrespaldo.sh

#Añadiendo el Script a CRON
 #Abrir crontab
 crontab -e
 #agregar que se ejcute a las 1:00 A.M.
 0 1 * * * /home/usuario/scripts/mysqlrespaldo.sh
