@echo off

@set YEAR=%date:~0,4%
@set MONTH=%date:~5,2%
@set DAY=%date:~8,2%
@set POSTFIX=%YEAR%-%MONTH%-%DAY%
mysqldump --user root -p1234 spring > C:\backup\spring_%POSTFIX%.sql