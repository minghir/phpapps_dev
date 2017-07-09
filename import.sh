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

#touch /var/www/html/phpapps_dev/php_quiz/sql/imp.sql
#cat /var/www/html/phpapps_dev/php_quiz/sql/imp_part.sql >> /var/www/html/phpapps_dev/php_quiz/sql/imp.sql
#cat /var/www/html/phpapps_dev/php_quiz/sql/php_quiz.sql >> /var/www/html/phpapps_dev/php_quiz/sql/imp.sql
#mysql  -u root  < /var/www/html/phpapps_dev/php_quiz/sql/imp.sql
#rm /var/www/html/phpapps_dev/php_quiz/sql/imp.sql


touch /var/www/html/phpapps_dev/plan_perf/sql/imp.sql
cat /var/www/html/phpapps_dev/plan_perf/sql/imp_part.sql >> /var/www/html/phpapps_dev/plan_perf/sql/imp.sql
cat /var/www/html/phpapps_dev/plan_perf/sql/plan_perf.sql >> /var/www/html/phpapps_dev/plan_perf/sql/imp.sql
mysql  -u root -palcatraz < /var/www/html/phpapps_dev/plan_perf/sql/imp.sql
rm /var/www/html/phpapps_dev/plan_perf/sql/imp.sql