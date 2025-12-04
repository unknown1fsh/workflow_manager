@echo off
chcp 65001 >nul
echo ========================================
echo  Port Temizleme - 8080 ve 4200
echo ========================================
echo.

set PORT_8080_FOUND=0
set PORT_4200_FOUND=0

echo [1/2] Port 8080 (Backend) kontrol ediliyor...
for /f "tokens=5" %%a in ('netstat -aon ^| findstr ":8080" ^| findstr "LISTENING"') do (
    set PID=%%a
    echo Port 8080 kullanan process bulundu. PID: %%a
    echo Kapatılıyor...
    taskkill /F /PID %%a >nul 2>&1
    if errorlevel 1 (
        echo [UYARI] Process kapatılamadı (PID: %%a). Yönetici olarak çalıştırmayı deneyin.
    ) else (
        echo [✓] Process başarıyla kapatıldı (PID: %%a)
        set PORT_8080_FOUND=1
    )
)

if %PORT_8080_FOUND%==0 (
    echo [✓] Port 8080 kullanılmıyor
)
echo.

echo [2/2] Port 4200 (Frontend) kontrol ediliyor...
for /f "tokens=5" %%a in ('netstat -aon ^| findstr ":4200" ^| findstr "LISTENING"') do (
    set PID=%%a
    echo Port 4200 kullanan process bulundu. PID: %%a
    echo Kapatılıyor...
    taskkill /F /PID %%a >nul 2>&1
    if errorlevel 1 (
        echo [UYARI] Process kapatılamadı (PID: %%a). Yönetici olarak çalıştırmayı deneyin.
    ) else (
        echo [✓] Process başarıyla kapatıldı (PID: %%a)
        set PORT_4200_FOUND=1
    )
)

if %PORT_4200_FOUND%==0 (
    echo [✓] Port 4200 kullanılmıyor
)
echo.

echo ========================================
echo  Port temizleme işlemi tamamlandı!
echo ========================================
echo.
pause

