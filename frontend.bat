@echo off
chcp 65001 >nul
echo ========================================
echo  Workflow Manager - Frontend
echo ========================================
echo.

cd /d "%~dp0workflow-manager-ui"
if errorlevel 1 (
    echo [HATA] workflow-manager-ui klasörü bulunamadı!
    pause
    exit /b 1
)

if not exist "node_modules" (
    echo Node modülleri yükleniyor...
    call npm install
)

echo Frontend başlatılıyor...
echo http://localhost:4200
echo.
echo Çıkmak için Ctrl+C
echo.

call npm start

pause
