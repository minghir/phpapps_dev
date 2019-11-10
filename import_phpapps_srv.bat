type D:\linuxport\work\www\phpapps_dev\phpapps\sql\imp_start.sql D:\linuxport\work\www\phpapps_dev\phpapps\sql\phpapps.sql D:\linuxport\work\www\phpapps_dev\phpapps\sql\imp_end.sql > D:\linuxport\work\www\phpapps_dev\phpapps\sql\import.sql 
D:\linuxport\mysql-5.6.26-win32\bin\mysql.exe --user=root  -palcatraz phpapps <   D:\work\www\phpapps_dev\phpapps\sql\import.sql

rem D:\linuxport\mysql-5.6.26-win32\bin\mysql.exe --user=root   phpapps <  D:\linuxport\work\www\phpapps_dev\phpapps\sql\imp_part.sql
rem D:\linuxport\mysql-5.6.26-win32\bin\mysql.exe --user=root   phpapps <  D:\linuxport\work\www\phpapps_dev\phpapps\sql\phpapps.sql

D:\linuxport\mysql-5.6.26-win32\bin\mysql.exe --user=root   eshop <   D:\linuxport\work\www\phpapps_dev\eshop_template\sql\imp_part.sql
D:\linuxport\mysql-5.6.26-win32\bin\mysql.exe --user=root   eshop <   D:\linuxport\work\www\phpapps_dev\eshop_template\sql\eshop.sql

D:\linuxport\mysql-5.6.26-win32\bin\mysql.exe --user=root  php_quiz < D:\linuxport\work\www\phpapps_dev\php_quiz\sql\imp_part.sql
D:\linuxport\mysql-5.6.26-win32\bin\mysql.exe --user=root  php_quiz < D:\linuxport\work\www\phpapps_dev\php_quiz\sql\php_quiz.sql

D:\linuxport\mysql-5.6.26-win32\bin\mysql.exe --user=root  atsepa <   D:\linuxport\work\www\phpapps_dev\atsepa\sql\imp_part.sql
D:\linuxport\mysql-5.6.26-win32\bin\mysql.exe --user=root  atsepa <   D:\linuxport\work\www\phpapps_dev\atsepa\sql\atsepa.sql
