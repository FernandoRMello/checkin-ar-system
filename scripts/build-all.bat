@echo off
title Build Sistema Check-in AR
color 0B

echo ================================
echo  BUILD SISTEMA CHECK-IN AR
echo ================================
echo.

REM Limpar diretórios anteriores
if exist "..\dist" rmdir /s /q "..\dist"
if exist "..\build" rmdir /s /q "..\build"

mkdir "..\dist"
mkdir "..\build"

echo [1/5] Instalando dependências do backend...
cd /d "%~dp0..\backend"
call npm install
if %errorlevel% neq 0 (
    echo ERRO: Falha ao instalar dependências do backend
    pause
    exit /b 1
)

echo.
echo [2/5] Instalando dependências do frontend...
cd /d "%~dp0..\frontend"
call npm install
if %errorlevel% neq 0 (
    echo ERRO: Falha ao instalar dependências do frontend
    pause
    exit /b 1
)

echo.
echo [3/5] Fazendo build do frontend...
call npm run build
if %errorlevel% neq 0 (
    echo ERRO: Falha no build do frontend
    pause
    exit /b 1
)

REM Copiar build do frontend para o backend
echo.
echo [4/5] Integrando frontend com backend...
xcopy /s /e /y "dist\*" "..\backend\public\"
if %errorlevel% neq 0 (
    echo ERRO: Falha ao copiar frontend
    pause
    exit /b 1
)

REM Atualizar server.js para servir arquivos estáticos
cd /d "%~dp0..\backend"

echo.
echo [5/5] Instalando pkg globalmente e gerando executável...
call npm install -g pkg
if %errorlevel% neq 0 (
    echo AVISO: Falha ao instalar pkg globalmente, tentando local...
    call npm install pkg --save-dev
)

call pkg . --out-path ../dist
if %errorlevel% neq 0 (
    echo ERRO: Falha ao gerar executável
    pause
    exit /b 1
)

echo.
echo ================================
echo  BUILD CONCLUÍDO COM SUCESSO!
echo ================================
echo.
echo Arquivos gerados em: ..\dist\
echo.
echo Executáveis disponíveis:
dir /b "..\dist\*.exe" 2>nul
echo.
echo Para instalar, execute: build-installer.bat
echo.
pause

