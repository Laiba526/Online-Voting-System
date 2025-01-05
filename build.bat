@echo off
echo ================================
echo Jenkins PHP Build Process Started
echo ================================

:: Step 1: Navigate to the project directory
cd /d "%~dp0"
echo Current Directory: %CD%

:: Step 2: Install PHP dependencies using Composer
echo Installing PHP dependencies...
composer install --no-dev --prefer-dist --optimize-autoloader
IF %ERRORLEVEL% NEQ 0 (
    echo ERROR: Composer dependencies installation failed!
    exit /b 1
)

:: Step 3: Ensure PHPUnit is installed (if not already)
echo Ensuring PHPUnit is installed...
composer require --dev phpunit/phpunit
IF %ERRORLEVEL% NEQ 0 (
    echo ERROR: PHPUnit installation failed!
    exit /b 1
)

:: Step 4: Run Unit Tests
echo Running PHP Unit Tests...
vendor\bin\phpunit --configuration phpunit.xml
IF %ERRORLEVEL% NEQ 0 (
    echo ERROR: Unit tests failed!
    exit /b 1
)

:: Step 5: Run Migrations (if applicable)
echo Running database migrations...
php artisan migrate --force
IF %ERRORLEVEL% NEQ 0 (
    echo ERROR: Database migrations failed!
    exit /b 1
)

:: Step 6: Optimize Application (optional)
echo Optimizing application...
php artisan config:cache
php artisan route:cache
php artisan view:cache

:: Step 7: Build completed successfully
echo ================================
echo Jenkins PHP Build Completed Successfully!
echo ================================
exit 0
