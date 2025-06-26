# Configuração para Deploy no Netlify

## Variáveis de Ambiente Necessárias

Para o frontend funcionar corretamente no Netlify, configure as seguintes variáveis de ambiente:

```
VITE_API_URL=https://seu-backend.onrender.com
VITE_APP_NAME=Sistema de Check-in AR Total Eventos
VITE_APP_VERSION=1.0.0
VITE_ENVIRONMENT=production
```

## Configurações de Build

- **Build command:** `npm run build`
- **Publish directory:** `dist`
- **Node version:** 18 ou superior

## Arquivos Importantes

- `netlify.toml` - Configurações do Netlify
- `_redirects` - Redirects para SPA (incluído no build)
- `manifest.json` - PWA manifest
- Service Worker configurado

## Backend

O backend precisa ser deployado separadamente em:
- Render.com (recomendado)
- Railway.app
- Heroku
- Ou qualquer serviço Node.js

Depois atualize a variável VITE_API_URL com a URL do seu backend.

