@echo off
title AnydeskActivator1.1
color 1F
setlocal EnableDelayedExpansion

:: Elevación automática si no es admin
fsutil dirty query %systemdrive% >nul 2>&1 || (
    echo Se requieren permisos de administrador.
    echo Reiniciando con privilegios elevados...
    powershell -Command "Start-Process cmd.exe -ArgumentList '/c cd /d \"%CD%\" && \"%~f0\" %*' -Verb RunAs"
    exit /b
)

:: Si recibe parámetro, realiza eliminación y sale
if "%~1"=="RUN_AT_START" goto ELIMINAR_DIRECTO

:MENU
cls
echo =============== AnydeskActivator1.1 ===============
echo ============== Se Encuentra en Beta ===============
echo == https://github.com/kambire/AnyDeskActivator/ ===
echo 1. Eliminar archivo service.conf
echo 2. Reiniciar servicio AnyDesk
echo 3. Verificar instalacion de AnyDesk
echo 4. Activar eliminacion en cada reinicio
echo 5. Salir
echo ===================================================
set /p option=Seleccione [1-5]:

if "%option%"=="1" goto ELIMINAR
if "%option%"=="2" goto REINICIAR
if "%option%"=="3" goto CHECK
if "%option%"=="4" goto AUTO_START
if "%option%"=="5" goto SALIR

echo Opción inválida.
timeout /t 2 >nul
goto MENU

:ELIMINAR
cls
echo Deteniendo AnyDesk...
taskkill /F /IM AnyDesk.exe >nul 2>&1
taskkill /F /IM AnyDesk_Service.exe >nul 2>&1
timeout /t 2 >nul
echo Eliminando service.conf...
del /F /Q "C:\ProgramData\AnyDesk\service.conf" >nul 2>&1
if exist "C:\ProgramData\AnyDesk\service.conf" (
    echo [!] No se pudo eliminar.
) else (
    echo [+] Eliminado exitosamente.
)
pause
goto MENU

:REINICIAR
cls
echo Reiniciando servicio AnyDesk...
sc stop AnyDesk >nul 2>&1
sc start AnyDesk >nul 2>&1
echo Servicio reiniciado.
pause
goto MENU

:CHECK
cls
echo Comprobando instalación de AnyDesk...
if exist "%ProgramFiles%\AnyDesk\AnyDesk.exe" (
    echo [+] AnyDesk instalado en "%ProgramFiles%\AnyDesk"
) else (
    echo [!] No se encontró instalación de AnyDesk
)
pause
goto MENU

:AUTO_START
cls
echo Creando tarea programada para eliminar service.conf en cada reinicio...
schtasks /Create /TN "AnydeskActivator1.1_DeleteServiceConf" ^
    /TR "\"%~f0\" RUN_AT_START" /SC ONSTART /RL HIGHEST /F >nul
if %errorlevel% equ 0 (
    echo [+] Tarea creada exitosamente.
) else (
    echo [!] Error al crear la tarea (¿ya existe?).
)
pause
goto MENU

:ELIMINAR_DIRECTO
:: Llamado desde tarea al iniciar Windows
taskkill /F /IM AnyDesk.exe >nul 2>&1
taskkill /F /IM AnyDesk_Service.exe >nul 2>&1
timeout /t 2 >nul
del /F /Q "C:\ProgramData\AnyDesk\service.conf" >nul 2>&1
exit /b

:SALIR
echo Saliendo...
timeout /t 1 >nul
exit /b
