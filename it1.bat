







REM Prejmenujte tento soubor na moje.bat a doplnte o potrebne prikazy
REM 1. Vypnuti vypisu informaci o provadenych prikazech, zmena barvy (bile pozadi, cerny text)
@echo off
color f0
cls
REM 2. Vypsat na obrazovku "Zalohovaci davkovy soubor" 

echo Zalohovaci davkovy soubor
REM 3. Vypsat do titulku "DAVKOVY SOUBOR: " a nazev davky
title DAVKOVY SOUBOR: %0
REM 4. Pozastavit beh davkoveho souboru az do stisku libovolne klavesy
pause
REM 5. Zajistit presun do korenoveho adresare disku E:
e:
cd \
REM 6. Pokud nebyl zadan 1.parametr - skok na navesti ERROR
if "%1"=="" goto :ERROR
echo Vytvorim zalohu
REM 7. Vytvorit slozku ZALOHA a podslozku zadanou v 1. parametru
md ZALOHA
md ZALOHA\%1
REM 8. Zkopirovat soubory *.EXE ze slozky C:\XAMPP\APACHE\BIN do slozky zadane 1. parametrem
copy C:\XAMPP\APACHE\BIN\*.exe ZALOHA\%1                     
REM 10. Zmenit atribut vsech souboru ve slozce tak, aby byly skryte a pouze pro cteni
ATTRIB +R +H ZALOHA\%1\*.*
REM 11. Vypsat obsah slozky zadane 1. parametrem do souboru ZALOHA.TXT, ktery bude ulozen do slozky ZALOHA
dir ZALOHA\%1 > ZALOHA\ZALOHA.TXT
REM 12. Vypsat na konec souboru ZALOHA.TXT informace o nastaveni sitovych zarizeni pocitace (ipconfig)
ipconfig >> ZALOHA\ZALOHA.TXT
REM 13. Zobrazit soubor ZALOHA.TXT v Poznamkovem bloku
notepad ZALOHA\ZALOHA.TXT
REM 14. Provede skok na navesti END
goto :END
REM 15. Vytvorte navesti ERROR a vypiste uzivateli hlaseni "Nebyl zadan 1. parametr!"
:ERROR
echo Nebyl zadan 1. parametr!
REM 16. Vytvorte navesti END  
:END
REM 17. Vypsat hlaseni "THE END" 
echo THE END
REM 18. Vymazat slozku ZALOHA pokud existuje (vcetne podslozek)
if exist ZALOHA rmdir ZALOHA /S /Q
REM Uklid
color
title Pøíkazový øádek
f:
cd \