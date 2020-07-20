@echo off
:: My stuff
color 09
echo ############################
echo ## Program made by LinuX  ##
echo ## Discord: malijoso#1195 ##
echo ############################
echo(
echo        #    #
echo(
echo      ##      ##
echo        ######
timeout /t 4 /nobreak > NUL
cls
:: Normal color
color 0f
goto choice
:: Makes u choose between custom time or pre maded time
:choiceInv
color c
echo Invalid input!
timeout /t 2 /nobreak > NUL
color f
:choice
set /p "thing=Do u want to put your own time or use choose one? (Y/N) 
if /i %thing% EQU y goto firstAsk
if /i %thing% EQU n goto chTime
if /i %thing% EQU Y goto firstAsk
if /i %thing% EQU N goto chTime
if /i %thing% NEQ y goto choiceInv
if /i %thing% NEQ n goto choiceInv
if /i %thing% NEQ Y goto choiceInv
if /i %thing% NEQ N goto choiceInv

echo(

:: If u want to use custom time this part of code makes it so the time for every loop is equal to the seconds inputed

:firstAsk    
    set /p "a=Enter the number of seconds: " || goto :firstAsk

    setlocal enabledelayedexpansion 
    for /f "delims=0123456789" %%a in ("!a!") do set "a="
    endlocal & set "a=%a%"

    if not defined a (
	color c
        echo Invalid input!
	timeout /t 2 /nobreak > NUL
	color f
        goto firstAsk
    )

goto loop

:: If you dont want to put the times yourself this makes it so u can choose already made up times for you 

:chTimeInv
color c
echo Invalid input!
timeout /t 2 /nobreak > NUL
color f
:chTime
echo a) 1 Hour
echo b) 45 Minutes
echo c) 30 Minutes
echo d) 15 Minutes
set /p "cTime=Choose the option: "
if /i %cTime% EQU a goto ac
if /i %cTime% EQU b goto bc
if /i %cTime% EQU c goto cc
if /i %cTime% EQU d goto dc
if /i %cTime% NEQ a goto chTimeInv
if /i %cTime% NEQ b goto chTimeInv
if /i %cTime% NEQ c goto chTimeInv
if /i %cTime% NEQ d goto chTimeInv

:: Time changed depending on the chosen option

:ac
set a=3600
goto loop
:bc
set a=2700
goto loop
:cc
set a=1800
goto loop
:dc
set a=900
goto loop

echo(
echo Start! :)

:: This is the thing that does the backup-ing

:loop
color f0

:: Delete the last files that were in the folder for saving the backup

del /q C:\ThePathToTheBackupFolder

:: Copy all the FILES from your SAVEDATA\MHFUsaves folder (input the path for that)
:: To the Backup folder (must make one then input the path)

xcopy C:\YourGameDataFolder C:\YourBackupFolder /E

cls
timeout /t %a% 
goto loop
