
#mysqldump -u root phpapps > /usr/local/www/apache24/data/phpapps_dev/phpapps/sql/phpapps.sql
echo "drop database phpapps;" > /var/www/html/phpapps_dev/phpapps/sql/phpapps.sql
echo "create database phpapps;" >> /var/www/html/phpapps_dev/phpapps/sql/phpapps.sql
echo "use database phpapps;" >> /var/www/html/phpapps_dev/phpapps/sql/phpapps.sql
mysqldump -u root phpapps >> /var/www/html/phpapps_dev/phpapps/sql/phpapps.sql