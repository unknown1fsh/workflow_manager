@echo off
chcp 65001 >nul
echo ========================================
echo  Workflow Manager - Backend
echo ========================================
echo.

cd /d "%~dp0workflow-manager"
if errorlevel 1 (
    echo [HATA] workflow-manager klasörü bulunamadı!
    pause
    exit /b 1
)

echo Backend başlatılıyor...
echo http://localhost:8080
echo Swagger: http://localhost:8080/swagger-ui.html
echo.
echo Çıkmak için Ctrl+C
echo.

call mvnw.cmd spring-boot:run

pause
