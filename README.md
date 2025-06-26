# Sistema de Check-in AR Total Eventos

Sistema web responsivo completo para controle de entrada de pessoas em eventos, desenvolvido especificamente para a AR Total Eventos.

## 🚀 Características Principais

### ✨ Funcionalidades Completas
- **Importação de Dados**: Importação automática via planilhas Excel (.xlsx)
- **Cadastro Manual**: Cadastro individual com OCR de documentos (Tesseract.js)
- **Check-in Digital**: Sistema de check-in com validação de pulseiras
- **Relatórios Gerenciais**: Dashboards com gráficos e estatísticas em tempo real
- **Gestão de Empresas**: Controle completo de empresas e setores
- **PWA**: Aplicação instalável em tablets, smartphones e desktops

### 🛠️ Tecnologias Utilizadas
- **Backend**: Node.js + Express + SQLite
- **Frontend**: React + Tailwind CSS + Vite
- **Banco de Dados**: SQLite (better-sqlite3)
- **OCR**: Tesseract.js para extração de texto de documentos
- **Excel**: SheetJS para importação de planilhas
- **PWA**: Service Worker + Manifest para funcionamento offline

### 📱 Compatibilidade
- **Desktop**: Windows, macOS, Linux
- **Mobile**: iOS (Safari), Android (Chrome)
- **Tablets**: iPad, Android tablets
- **Instalação**: PWA instalável em todos os dispositivos

## 📋 Requisitos do Sistema

### Para Desenvolvimento
- Node.js 18+ 
- npm ou pnpm
- Git

### Para Produção
- Windows 10+ (para executável .exe)
- 4GB RAM mínimo
- 1GB espaço em disco
- Conexão de rede local (para acesso multi-dispositivo)

## 🔧 Instalação e Configuração

### Opção 1: Instalação Rápida (Windows)
1. Baixe o instalador `CheckinAR-Setup-v1.0.0.exe`
2. Execute como administrador
3. Siga o assistente de instalação
4. O sistema será instalado em `C:\CheckinAR`
5. Use o atalho na área de trabalho para iniciar

### Opção 2: Desenvolvimento Local
```bash
# Clone o repositório
git clone git clone https://github.com/FernandoRMello/checkin-ar-system.git
cd checkin-ar-system

# Instalar dependências do backend
cd backend
npm install

# Instalar dependências do frontend
cd ../frontend
npm install

# Iniciar o sistema
cd ../scripts
./start-development.sh  # Linux/Mac
start-development.bat   # Windows
```

## 🚀 Como Usar

### 1. Primeiro Acesso
1. Inicie o sistema usando o atalho ou script
2. Acesse `http://localhost:3001` no navegador
3. Configure a primeira empresa em "Configurações"

### 2. Importar Dados
1. Prepare uma planilha Excel com as colunas:
   - `nome`: Nome completo da pessoa
   - `documento`: CPF ou RG (apenas números)
   - `empresa`: Nome da empresa
   - `setor`: Setor da pessoa (opcional)
2. Vá em "Importar" → "Selecionar Arquivo"
3. Valide os dados e clique em "Importar"

### 3. Cadastro Manual
1. Acesse "Cadastro"
2. Opcionalmente, faça upload de uma foto do documento para OCR
3. Preencha os dados manualmente
4. Selecione a empresa ou crie uma nova
5. Clique em "Cadastrar Pessoa"

### 4. Realizar Check-in
1. Acesse "Check-in"
2. Digite o CPF ou RG da pessoa
3. Clique em "Buscar" para carregar os dados
4. Digite o número da pulseira
5. Clique em "Confirmar Check-in"

### 5. Visualizar Relatórios
1. Acesse "Relatórios"
2. Use os filtros de data se necessário
3. Escolha o tipo de relatório:
   - Por Empresa
   - Por Setor
   - Por Horário
   - Detalhado
4. Exporte em CSV se necessário

## 🌐 Acesso Multi-Dispositivo

### Configuração de Rede
O sistema detecta automaticamente o IP local e exibe as informações de acesso:

```
🚀 Servidor iniciado com sucesso!
📍 Local: http://localhost:3001
🌐 Rede: http://192.168.1.100:3001
📱 Para acessar de outros dispositivos, use: http://192.168.1.100:3001
```

### Instalação PWA em Dispositivos Móveis

#### iOS (iPhone/iPad)
1. Abra o Safari e acesse o sistema
2. Toque no ícone de compartilhamento
3. Selecione "Adicionar à Tela de Início"
4. Confirme a instalação

#### Android
1. Abra o Chrome e acesse o sistema
2. Toque no menu (3 pontos)
3. Selecione "Adicionar à tela inicial"
4. Confirme a instalação

## 📊 Estrutura do Banco de Dados

### Tabela: empresas
- `id`: Identificador único
- `nome`: Nome da empresa
- `created_at`: Data de criação

### Tabela: pessoas
- `id`: Identificador único
- `nome`: Nome completo
- `documento`: CPF ou RG
- `empresa_id`: Referência à empresa
- `setor`: Setor da pessoa
- `created_at`: Data de cadastro

### Tabela: checkins
- `id`: Identificador único
- `pessoa_id`: Referência à pessoa
- `pulseira`: Número da pulseira
- `created_at`: Data/hora do check-in

## 🔒 Segurança

### Medidas Implementadas
- Validação de dados no frontend e backend
- Sanitização de entradas
- Prevenção de SQL injection
- Headers de segurança (Helmet.js)
- Validação de tipos de arquivo
- Limitação de tamanho de upload

### Backup de Dados
O banco SQLite fica em `backend/database/checkin.db`. Faça backup regular deste arquivo.

## 🛠️ Scripts Disponíveis

### Backend
```bash
npm start          # Iniciar servidor
npm run dev        # Desenvolvimento com nodemon
```

### Frontend
```bash
npm run dev        # Servidor de desenvolvimento
npm run build      # Build para produção
npm run preview    # Preview do build
```

### Scripts de Deploy
```bash
# Windows
scripts/build-all.bat         # Build completo
scripts/start-checkin-ar.bat  # Iniciar sistema

# Linux/Mac
scripts/deploy-netlify.sh     # Deploy para Netlify
```

## 📁 Estrutura do Projeto

```
checkin-ar-system/
├── backend/                 # Servidor Node.js
│   ├── database/           # Banco SQLite
│   ├── routes/             # Rotas da API
│   ├── uploads/            # Arquivos enviados
│   └── server.js           # Servidor principal
├── frontend/               # Aplicação React
│   ├── src/
│   │   ├── components/     # Componentes UI
│   │   ├── pages/          # Páginas da aplicação
│   │   └── lib/            # Utilitários
│   └── public/             # Arquivos estáticos
├── scripts/                # Scripts de build/deploy
├── docs/                   # Documentação
└── dist/                   # Builds de produção
```

## 🐛 Solução de Problemas

### Problema: Servidor não inicia
**Solução**: Verifique se a porta 3001 está livre ou altere no arquivo `server.js`

### Problema: Erro de permissão no Windows
**Solução**: Execute como administrador

### Problema: OCR não funciona
**Solução**: Verifique a qualidade da imagem e iluminação

### Problema: Import Excel falha
**Solução**: Verifique se as colunas estão nomeadas corretamente

### Problema: PWA não instala
**Solução**: Certifique-se de estar usando HTTPS ou localhost

## 📞 Suporte

Para suporte técnico, entre em contato:
- **Email**: suporte@artotaleventos.com.br
- **Telefone**: (11) 99999-9999
- **Site**: https://artotaleventos.com.br

## 📝 Licença

Este sistema foi desenvolvido exclusivamente para AR Total Eventos.
Todos os direitos reservados © 2025 AR Total Eventos.

## 🔄 Atualizações

### Versão 1.0.0 (Atual)
- ✅ Sistema completo de check-in
- ✅ Importação Excel
- ✅ OCR de documentos
- ✅ Relatórios gerenciais
- ✅ PWA instalável
- ✅ Deploy offline e online

### Próximas Versões
- 🔄 Integração com impressoras térmicas
- 🔄 Notificações push
- 🔄 Backup automático na nuvem
- 🔄 API para integração externa

---

**Desenvolvido com ❤️ para AR Total Eventos**

