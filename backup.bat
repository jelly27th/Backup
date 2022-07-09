@echo off

@REM Set the path to bz.exe
set bz=C:\SOFEWARE\Bandizip\bz.exe

@REM Get the current backup time
set YYYYmmdd=%date:~0,4%-%date:~5,2%-%date:~8,2%

@REM set the path to source folder
set Code=C:\STORAGE\Code
set Blog=C:\Blog
set Pictures=C:\STORAGE\Pictures
set Blender=C:\STORAGE\Blender

@REM set the path to target folder
set targetPath=C:\STORAGE\Backup\%YYYYmmdd%\
@REM Set the file path to search
set originalPath=C:\STORAGE\Backup\

@REM start backup 
%bz% c -aoa -y -fmt:zip "%targetPath%Code" "%Code%"
%bz% c -aoa -y -fmt:zip "%targetPath%Blog" "%Blog%"
%bz% c -aoa -y -fmt:zip "%targetPath%Pictures" "%Pictures%"
%bz% c -aoa -y -fmt:zip "%targetPath%Blender" "%Blender%"

echo %originalPath%
@REM Delete backups folders older than 3 days
forfiles /P "%originalPath%\" /S /M *.* /D -3 /C "cmd /c rd /s/q @path" 

echo #############end backup####################
exit
