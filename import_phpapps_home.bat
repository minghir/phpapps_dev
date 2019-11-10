SET PATH_TO_MYSQL=D:\linuxport\mysql-8.0.17-winx64\bin
SET PATH_TO_IMP_FILES=D:\work\www\phpapps_dev

rem set list = "phpapps" "eshop_template"

SET DATABASE=phpapps
type %PATH_TO_IMP_FILES%\%DATABASE%\sql\imp_start.sql %PATH_TO_IMP_FILES%\%DATABASE%\sql\%DATABASE%.sql %PATH_TO_IMP_FILES%\%DATABASE%\sql\imp_end.sql > %PATH_TO_IMP_FILES%\%DATABASE%\sql\import.sql 
%PATH_TO_MYSQL%\mysql.exe --user=root  -palcatraz  <   D:\work\www\phpapps_dev\%DATABASE%\sql\import.sql

SET DATABASE=php_quiz
type %PATH_TO_IMP_FILES%\%DATABASE%\sql\imp_start.sql %PATH_TO_IMP_FILES%\%DATABASE%\sql\%DATABASE%.sql %PATH_TO_IMP_FILES%\%DATABASE%\sql\imp_end.sql > %PATH_TO_IMP_FILES%\%DATABASE%\sql\import.sql 
%PATH_TO_MYSQL%\mysql.exe --user=root  -palcatraz  <   D:\work\www\phpapps_dev\%DATABASE%\sql\import.sql

SET DATABASE=atsepa
type %PATH_TO_IMP_FILES%\%DATABASE%\sql\imp_start.sql %PATH_TO_IMP_FILES%\%DATABASE%\sql\%DATABASE%.sql %PATH_TO_IMP_FILES%\%DATABASE%\sql\imp_end.sql > %PATH_TO_IMP_FILES%\%DATABASE%\sql\import.sql 
%PATH_TO_MYSQL%\mysql.exe --user=root  -palcatraz  <   D:\work\www\phpapps_dev\%DATABASE%\sql\import.sql

SET DATABASE=eshop_template
type %PATH_TO_IMP_FILES%\%DATABASE%\sql\imp_start.sql %PATH_TO_IMP_FILES%\%DATABASE%\sql\%DATABASE%.sql %PATH_TO_IMP_FILES%\%DATABASE%\sql\imp_end.sql > %PATH_TO_IMP_FILES%\%DATABASE%\sql\import.sql 
%PATH_TO_MYSQL%\mysql.exe --user=root  -palcatraz  <   D:\work\www\phpapps_dev\%DATABASE%\sql\import.sql

pause
