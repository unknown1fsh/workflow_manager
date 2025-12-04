@echo off
chcp 65001 >nul
echo ========================================
echo  Port Temizleme (8080 ve 4200)
echo ========================================
echo.

echo Port 8080 kontrol ediliyor...
for /f "tokens=5" %%a in ('netstat -aon ^| findstr ":8080" ^| findstr "LISTENING"') do (
    taskkill /F /PID %%a >nul 2>&1
    if errorlevel 1 (
        echo [UYARI] Port 8080 kapatılamadı (PID: %%a)
    ) else (
        echo [OK] Port 8080 temizlendi (PID: %%a)
    )
)

echo Port 4200 kontrol ediliyor...
for /f "tokens=5" %%a in ('netstat -aon ^| findstr ":4200" ^| findstr "LISTENING"') do (
    taskkill /F /PID %%a >nul 2>&1
    if errorlevel 1 (
        echo [UYARI] Port 4200 kapatılamadı (PID: %%a)
    ) else (
        echo [OK] Port 4200 temizlendi (PID: %%a)
    )
)

echo.
echo Tamamlandı!
pause
