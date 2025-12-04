@echo off
chcp 65001 >nul
echo ========================================
echo  Workflow Manager - Frontend Başlatılıyor
echo ========================================
echo.

echo [1/3] Frontend klasörüne geçiliyor...
cd /d "%~dp0workflow-manager-ui"
if errorlevel 1 (
    echo [HATA] workflow-manager-ui klasörü bulunamadı!
    pause
    exit /b 1
)
echo [✓] Klasör: %CD%
echo.

echo [2/3] Node.js modülleri kontrol ediliyor...
if not exist "node_modules" (
    echo node_modules klasörü bulunamadı. Yükleniyor...
    echo Bu işlem birkaç dakika sürebilir...
    call npm install
    if errorlevel 1 (
        echo [HATA] npm install başarısız! Node.js kurulu mu kontrol edin.
        pause
        exit /b 1
    )
    echo [✓] Node modülleri yüklendi
) else (
    echo [✓] Node modülleri mevcut
)
echo.

echo [3/3] Angular uygulaması başlatılıyor...
echo.
echo ========================================
echo  Frontend http://localhost:4200 adresinde çalışacak
echo  Backend'in çalıştığından emin olun: http://localhost:8080
echo ========================================
echo.
echo Çıkmak için Ctrl+C tuşlarına basın...
echo.

REM Angular uygulamasını başlat
call npm start

if errorlevel 1 (
    echo.
    echo [HATA] Uygulama başlatılamadı!
    pause
    exit /b 1
)

