@echo off
chcp 65001 >nul
echo ========================================
echo  Workflow Manager - Full Stack Başlatılıyor
echo ========================================
echo.
echo Backend ve Frontend aynı anda başlatılacak...
echo İki ayrı pencere açılacak.
echo.
pause

REM Backend'i yeni bir pencerede başlat
start "Workflow Manager - Backend" cmd /k "%~dp0backend.bat"

REM 5 saniye bekle (backend'in başlaması için)
timeout /t 5 /nobreak >nul

REM Frontend'i yeni bir pencerede başlat
start "Workflow Manager - Frontend" cmd /k "%~dp0frontend.bat"

echo.
echo ========================================
echo  Her iki uygulama da başlatıldı!
echo ========================================
echo.
echo Backend:  http://localhost:8080
echo Frontend: http://localhost:4200
echo.
echo Pencereleri kapatmak için her pencerede Ctrl+C tuşlarına basın.
echo.
pause

