touch /var/www/html/phpapps_dev/phpapps/sql/imp.sql
cat /var/www/html/phpapps_dev/phpapps/sql/imp_part.sql >> /var/www/html/phpapps_dev/phpapps/sql/imp.sql
cat /var/www/html/phpapps_dev/phpapps/sql/phpapps.sql >> /var/www/html/phpapps_dev/phpapps/sql/imp.sql
mysql --init-command="SET SESSION FOREIGN_KEY_CHECKS=0;" -u root -palcatraz < /var/www/html/phpapps_dev/phpapps/sql/imp.sql
rm /var/www/html/phpapps_dev/phpapps/sql/imp.sql

touch /var/www/html/phpapps_dev/eshop_template/sql/imp.sql
cat /var/www/html/phpapps_dev/eshop_template/sql/imp_part.sql >> /var/www/html/phpapps_dev/eshop_template/sql/imp.sql
cat /var/www/html/phpapps_dev/eshop_template/sql/eshop.sql >> /var/www/html/phpapps_dev/eshop_template/sql/imp.sql
mysql  -u root -palcatraz < /var/www/html/phpapps_dev/eshop_template/sql/imp.sql
rm /var/www/html/phpapps_dev/eshop_template/sql/imp.sql


touch /var/www/html/phpapps_dev/atsepa/sql/imp.sql
cat /var/www/html/phpapps_dev/atsepa/sql/imp_part.sql >> /var/www/html/phpapps_dev/atsepa/sql/imp.sql
cat /var/www/html/phpapps_dev/atsepa/sql/atsepa.sql >> /var/www/html/phpapps_dev/atsepa/sql/imp.sql
mysql  -u root -palcatraz < /var/www/html/phpapps_dev/atsepa/sql/imp.sql
rm /var/www/html/phpapps_dev/atsepa/sql/imp.sql