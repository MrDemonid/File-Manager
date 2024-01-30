@echo off
set SOURCES=.
set BINARY=..\bin
set ASM=..\ma80


del %BINARY%\fm.com
del fm.com
del fm.rel
cls

%ASM%\ma80.exe fm,fm=fm
if errorlevel == 1 goto error

%ASM%\mlink fm
if errorlevel == 1 goto error

if not exist fm.com goto error

copy /b fm.com %BINARY%\fm.com

del fm.com
del fm.rel
del fm.prn

echo =============================================
echo = Yeehaw! FM.COM created! No Errors! Ready! =
echo =============================================

goto end

:error
echo ######################################
echo ######### AN ERROR OCCURED! ##########
echo ######################################

:end
pause
