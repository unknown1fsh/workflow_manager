@echo off
chcp 65001 >nul
echo ========================================
echo  Workflow Manager - Backend Başlatılıyor
echo ========================================
echo.

REM MySQL yolunu ayarla
set MYSQL_PATH=C:\Program Files\MySQL\MySQL Server 8.0\bin
set DB_NAME=smart_workflow_db
set DB_USER=root
set DB_PASSWORD=12345

echo [1/4] MySQL Veritabanı Kontrol Ediliyor...
echo.

REM MySQL bin dizininin var olup olmadığını kontrol et
if not exist "%MYSQL_PATH%\mysql.exe" (
    echo [HATA] MySQL bulunamadı! Lütfen MySQL yolunu kontrol edin.
    echo Beklenen yol: %MYSQL_PATH%
    pause
    exit /b 1
)

REM MySQL servisinin çalışıp çalışmadığını kontrol et
echo MySQL servisi kontrol ediliyor...
sc query MySQL80 | find "RUNNING" >nul 2>&1
if errorlevel 1 (
    echo [UYARI] MySQL80 servisi çalışmıyor görünüyor. Başlatılıyor...
    net start MySQL80 >nul 2>&1
    timeout /t 3 /nobreak >nul
)

REM MySQL bağlantısını test et (şifre stdin'den)
echo MySQL bağlantısı test ediliyor...
echo %DB_PASSWORD% | "%MYSQL_PATH%\mysql.exe" -u%DB_USER% -p --silent -e "SELECT 1;" >nul 2>&1
if errorlevel 1 (
    echo.
    echo [HATA] MySQL bağlantısı başarısız!
    echo.
    echo Kontrol edilmesi gerekenler:
    echo   1. MySQL servisi çalışıyor mu? (Windows Hizmetler - MySQL80)
    echo   2. MySQL kullanıcı adı doğru mu? (Şu an: %DB_USER%)
    echo   3. MySQL şifresi doğru mu? (Şu an: %DB_PASSWORD%)
    echo   4. MySQL yolu doğru mu? (Şu an: %MYSQL_PATH%)
    echo.
    echo Manuel test için şu komutu çalıştırın:
    echo   "%MYSQL_PATH%\mysql.exe" -u%DB_USER% -p
    echo.
    pause
    exit /b 1
)
echo [✓] MySQL bağlantısı başarılı

REM Veritabanının var olup olmadığını kontrol et
echo Veritabanı kontrol ediliyor...
echo %DB_PASSWORD% | "%MYSQL_PATH%\mysql.exe" -u%DB_USER% -p --silent -e "USE %DB_NAME%;" >nul 2>&1
if errorlevel 1 (
    echo Veritabanı bulunamadı. Oluşturuluyor...
    echo %DB_PASSWORD% | "%MYSQL_PATH%\mysql.exe" -u%DB_USER% -p --silent -e "CREATE DATABASE IF NOT EXISTS %DB_NAME% CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;" >nul 2>&1
    if errorlevel 1 (
        echo [HATA] Veritabanı oluşturulamadı!
        pause
        exit /b 1
    )
    echo [✓] Veritabanı başarıyla oluşturuldu: %DB_NAME%
) else (
    echo [✓] Veritabanı mevcut: %DB_NAME%
)
echo.

echo [2/4] Backend klasörüne geçiliyor...
cd /d "%~dp0workflow-manager"
if errorlevel 1 (
    echo [HATA] workflow-manager klasörü bulunamadı!
    pause
    exit /b 1
)
echo [✓] Klasör: %CD%
echo.

echo [3/4] Maven wrapper kontrol ediliyor...
if not exist "mvnw.cmd" (
    echo [HATA] mvnw.cmd bulunamadı! Maven kurulu mu kontrol edin.
    pause
    exit /b 1
)
echo [✓] Maven wrapper hazır
echo.

echo [4/4] Spring Boot uygulaması başlatılıyor...
echo.
echo ========================================
echo  Backend http://localhost:8080 adresinde çalışacak
echo  Swagger UI: http://localhost:8080/swagger-ui.html
echo ========================================
echo.
echo Çıkmak için Ctrl+C tuşlarına basın...
echo.

REM Maven wrapper ile Spring Boot uygulamasını başlat
call mvnw.cmd spring-boot:run

if errorlevel 1 (
    echo.
    echo [HATA] Uygulama başlatılamadı!
    pause
    exit /b 1
)

