@echo off
cd ..
if exist EmerCon.exe set launcher=EmerCon.exe
if exist Reborn.exe set launcher=Reborn.exe
if exist Metamorphosis.exe set launcher=Metamorphosis.exe

git symbolic-ref --short HEAD > .temp
set /p branch= < .temp
del .temp

git describe --tags > .temp
set /p ver= < .temp
del .temp 

echo [DTA] > version
echo Version=%branch%_%ver% >> version

if exist "Release\client_%branch%_%ver%.zip" del "Release\client_%branch%_%ver%.zip"
"%PROGRAMFILES%\7-Zip\7z.exe" a "Release\client_%branch%_%ver%.zip" "INI\" "Map Renderer\" "Maps\" "Resources\" "cncnet5.dll" %launcher% "version"

del version
pause 
