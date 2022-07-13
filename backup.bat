@echo off

@REM run as administrator
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit cd /d "%~dp0"

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

echo #############originalPath=%originalPath%#############
@REM Delete backups folders older than 3 days
@REM forfiles /P "%originalPath%\" /S /M *.* /D -3 /C "cmd /c rd /s/q @path" 
@REM forfiles /P "%originalPath%\" /S /M *.* /D -3 /C "cmd /c echo @path" 
@REM forfiles /P "%originalPath%\" /S /M *.* /D -3 /C "cmd /c echo @isdir" 
forfiles /P "%originalPath%\" /S /M *.* /D -3 /C "cmd /c del /s/q @path"

@REM Delete empty folders under backup directory
for /f "delims=" %%a in ('dir /ad /b /s "%originalPath%"^|sort /r') do (
   echo %%a
   rd "%%a">nul 2>nul && echo empty folder "%%a" delete sucessfully!
)

echo #############end backup####################
pause
exit
