@echo off
chcp 65001 > nul

:loop
cls

echo Встречайте Durian opertion system!

echo версии Durian os
echo 1.Durian classic lua editon
echo 2.Durian++ editon for windows
::echo 3.Durian c# editon, Отсутсвует!!
echo 3.Справка
set /p version="выбирете версю >> "

if "%version%"=="1" (
    start C:\durian\durian_lua\main.lua
     exit
)

if "%version%"=="2" (
    start C:\durian\Durian++\durian++.exe
    exit
)

::if "%version%"=="3" (
::    echo durian c# не куплен!
::    timeout /t 2 > nul
::)

if "%version%"=="3" (
    cls
    echo 1.как купить durian c# ?
    echo Ответ: сейчас это невозможно
    echo 2.можно ли пользоваться Durian++ на linux ?
    echo Ответ: ну ты же запустил этот батник
    echo 3.как скачать lua для Durian classic lua editon ?
    echo https://github.com/rjpcomputing/luaforwindows
    echo 4.у меня не запускается
    echo Ответ: распакуйте так 
    echo Каталог: C:\durian
    echo    папки
    echo    Durian c# - для Durian c# editon
    echo    Durian++ - для Durian++ editon for windows
    echo    durian_lua - Durian classic lua editon
    echo нажмите на любую клавишу
    pause > nul
)
goto loop
pause
