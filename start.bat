@echo off

:: Настройки
set "PHP_PORT=1234"
set "PHP_EXE=%~dp0library\php\php.exe"
set "EXT_DIR=%~dp0library\php\ext"

:: 1. Переходим в рабочую папку
cd /D "%~dp0"

:: 2. Запускаем PHP-сервер
:: Используем /B, чтобы PHP не создавал лишних окон, если это не требуется
echo Starting PHP server on port %PHP_PORT%...
start "" /B "%PHP_EXE%" -S 0.0.0.0:%PHP_PORT% -c "%~dp0library\php\php.ini" -d extension_dir="%EXT_DIR%" -d display_errors=On -d error_reporting=E_ALL

:: 3. Запускаем приложение
echo Starting Ventra3D...
start http://127.0.0.1:1234/ventra3d.html