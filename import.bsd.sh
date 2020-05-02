touch /usr/local/www/apache24/data/phpapps_dev/phpapps/sql/imp.sql
cat /usr/local/www/apache24/data/phpapps_dev/phpapps/sql/imp_start.sql >> /usr/local/www/apache24/data/phpapps_dev/phpapps/sql/imp.sql
cat /usr/local/www/apache24/data/phpapps_dev/phpapps/sql/phpapps.sql >> /usr/local/www/apache24/data/phpapps_dev/phpapps/sql/imp.sql
cat /usr/local/www/apache24/data/phpapps_dev/phpapps/sql/imp_end.sql >> /usr/local/www/apache24/data/phpapps_dev/phpapps/sql/imp.sql
mysql --init-command="SET SESSION FOREIGN_KEY_CHECKS=0;" -u root -palcatraz < /usr/local/www/apache24/data/phpapps_dev/phpapps/sql/imp.sql
rm /usr/local/www/apache24/data/phpapps_dev/phpapps/sql/imp.sql

touch /usr/local/www/apache24/data/phpapps_dev/eshop_template/sql/imp.sql
cat /usr/local/www/apache24/data/phpapps_dev/eshop_template/sql/imp_start.sql >> /usr/local/www/apache24/data/phpapps_dev/eshop_template/sql/imp.sql
cat /usr/local/www/apache24/data/phpapps_dev/eshop_template/sql/eshop.sql >> /usr/local/www/apache24/data/phpapps_dev/eshop_template/sql/imp.sql
cat /usr/local/www/apache24/data/phpapps_dev/eshop_template/sql/imp_end.sql >> /usr/local/www/apache24/data/phpapps_dev/eshop_template/sql/imp.sql
mysql  -u root -palcatraz < /usr/local/www/apache24/data/phpapps_dev/eshop_template/sql/imp.sql
rm /usr/local/www/apache24/data/phpapps_dev/eshop_template/sql/imp.sql


touch /usr/local/www/apache24/data/phpapps_dev/atsepa/sql/imp.sql
cat /usr/local/www/apache24/data/phpapps_dev/atsepa/sql/imp_start.sql >> /usr/local/www/apache24/data/phpapps_dev/atsepa/sql/imp.sql
cat /usr/local/www/apache24/data/phpapps_dev/atsepa/sql/atsepa.sql >> /usr/local/www/apache24/data/phpapps_dev/atsepa/sql/imp.sql
cat /usr/local/www/apache24/data/phpapps_dev/atsepa/sql/imp_end.sql >> /usr/local/www/apache24/data/phpapps_dev/atsepa/sql/imp.sql
mysql  -u root -palcatraz < /usr/local/www/apache24/data/phpapps_dev/atsepa/sql/imp.sql
rm /usr/local/www/apache24/data/phpapps_dev/atsepa/sql/imp.sql