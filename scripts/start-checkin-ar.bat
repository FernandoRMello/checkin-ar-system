@echo off
title Sistema de Check-in AR Total Eventos
color 0A

echo ================================
echo  Sistema de Check-in AR Total
echo ================================
echo.
echo Iniciando servidor...
echo.

REM Detectar IP local
for /f "tokens=2 delims=:" %%a in ('ipconfig ^| findstr /c:"IPv4"') do (
    for /f "tokens=1" %%b in ("%%a") do (
        set LOCAL_IP=%%b
        goto :found
    )
)
:found

REM Iniciar o servidor backend
cd /d "%~dp0..\backend"
echo Backend iniciando na porta 3001...
start "Backend" cmd /k "node server.js"

REM Aguardar alguns segundos
timeout /t 3 /nobreak >nul

REM Mostrar informações de acesso
echo.
echo ================================
echo  SISTEMA INICIADO COM SUCESSO!
echo ================================
echo.
echo Acesso Local:    http://localhost:3001
echo Acesso na Rede:  http://%LOCAL_IP%:3001
echo.
echo Para acessar de tablets/celulares:
echo Use o endereço: http://%LOCAL_IP%:3001
echo.
echo Pressione qualquer tecla para abrir o sistema...
pause >nul

REM Abrir navegador
start http://localhost:3001

REM Manter janela aberta
echo.
echo Sistema rodando... Pressione CTRL+C para parar.
pause >nul

