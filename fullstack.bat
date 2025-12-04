@echo off
chcp 65001 >nul
echo ========================================
echo  Workflow Manager - Full Stack
echo ========================================
echo.

echo Backend ve Frontend başlatılıyor...
echo.

start "Backend" cmd /k "%~dp0backend.bat"
timeout /t 3 /nobreak >nul
start "Frontend" cmd /k "%~dp0frontend.bat"

echo.
echo Backend:  http://localhost:8080
echo Frontend: http://localhost:4200
echo.
echo Her iki pencere de açıldı!
pause
