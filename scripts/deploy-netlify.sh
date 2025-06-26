#!/bin/bash

# Script de Deploy para Netlify
# Sistema de Check-in AR Total Eventos

echo "================================"
echo "  DEPLOY NETLIFY - CHECK-IN AR"
echo "================================"
echo

# Verificar se está no diretório correto
if [ ! -f "../package.json" ] && [ ! -d "../frontend" ]; then
    echo "ERRO: Execute este script a partir do diretório scripts/"
    exit 1
fi

# Navegar para o diretório frontend
cd ../frontend

echo "[1/4] Instalando dependências..."
npm install
if [ $? -ne 0 ]; then
    echo "ERRO: Falha ao instalar dependências"
    exit 1
fi

echo
echo "[2/4] Configurando para produção..."

# Criar arquivo de configuração para produção
cat > .env.production << EOF
VITE_API_URL=https://checkin-ar-backend.herokuapp.com
VITE_APP_NAME=Sistema de Check-in AR Total Eventos
VITE_APP_VERSION=1.0.0
EOF

echo
echo "[3/4] Fazendo build para produção..."
npm run build
if [ $? -ne 0 ]; then
    echo "ERRO: Falha no build"
    exit 1
fi

echo
echo "[4/4] Preparando arquivos para deploy..."

# Criar arquivo _redirects para SPA
cat > dist/_redirects << EOF
# Redirects para SPA (Single Page Application)
/*    /index.html   200

# Headers de segurança
/*
  X-Frame-Options: DENY
  X-Content-Type-Options: nosniff
  X-XSS-Protection: 1; mode=block
  Referrer-Policy: strict-origin-when-cross-origin
  Permissions-Policy: geolocation=(), microphone=(), camera=()
EOF

# Criar arquivo netlify.toml
cat > netlify.toml << EOF
[build]
  publish = "dist"
  command = "npm run build"

[build.environment]
  NODE_VERSION = "18"

[[headers]]
  for = "/*"
  [headers.values]
    X-Frame-Options = "DENY"
    X-Content-Type-Options = "nosniff"
    X-XSS-Protection = "1; mode=block"
    Referrer-Policy = "strict-origin-when-cross-origin"

[[headers]]
  for = "/manifest.json"
  [headers.values]
    Content-Type = "application/manifest+json"

[[headers]]
  for = "/sw.js"
  [headers.values]
    Content-Type = "application/javascript"
    Cache-Control = "no-cache"

[[redirects]]
  from = "/*"
  to = "/index.html"
  status = 200

[dev]
  command = "npm run dev"
  port = 5173
  publish = "dist"
EOF

echo
echo "================================"
echo "  DEPLOY PREPARADO COM SUCESSO!"
echo "================================"
echo
echo "Próximos passos:"
echo "1. Instale o Netlify CLI: npm install -g netlify-cli"
echo "2. Faça login: netlify login"
echo "3. Deploy: netlify deploy --prod --dir=dist"
echo
echo "Ou conecte o repositório Git ao Netlify para deploy automático."
echo
echo "Arquivos prontos em: $(pwd)/dist/"
echo

