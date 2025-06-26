# Manual de Instalação - Sistema Check-in AR

## 📋 Pré-requisitos

### Hardware Mínimo
- **Processador**: Intel Core i3 ou AMD equivalente
- **Memória RAM**: 4GB (recomendado 8GB)
- **Armazenamento**: 2GB livres
- **Rede**: Conexão Wi-Fi ou Ethernet

### Software
- **Sistema Operacional**: Windows 10/11 (64-bit)
- **Navegador**: Chrome, Firefox, Safari ou Edge (versão atual)
- **Permissões**: Administrador para instalação

## 🚀 Instalação Automática (Recomendada)

### Passo 1: Download
1. Acesse o link fornecido pela AR Total Eventos
2. Baixe o arquivo `CheckinAR-Setup-v1.0.0.exe`
3. Salve em uma pasta de fácil acesso (ex: Desktop)

### Passo 2: Instalação
1. **Clique com botão direito** no arquivo baixado
2. Selecione **"Executar como administrador"**
3. Se aparecer aviso do Windows Defender, clique em **"Mais informações"** → **"Executar assim mesmo"**

### Passo 3: Assistente de Instalação
1. **Tela de Boas-vindas**
   - Clique em "Avançar"

2. **Contrato de Licença**
   - Leia os termos
   - Marque "Aceito os termos"
   - Clique em "Avançar"

3. **Pasta de Destino**
   - Padrão: `C:\CheckinAR`
   - Altere se necessário
   - Clique em "Avançar"

4. **Componentes**
   - Deixe todas as opções marcadas:
     - ✅ Sistema Principal
     - ✅ Atalho na Área de Trabalho
     - ✅ Iniciar com Windows (opcional)
   - Clique em "Avançar"

5. **Instalação**
   - Aguarde a cópia dos arquivos
   - Processo leva 1-3 minutos

6. **Finalização**
   - ✅ Marque "Executar Sistema Check-in AR"
   - Clique em "Concluir"

### Passo 4: Primeiro Acesso
1. O sistema abrirá automaticamente
2. Uma janela do prompt aparecerá mostrando:
   ```
   ================================
    SISTEMA INICIADO COM SUCESSO!
   ================================
   
   Acesso Local:    http://localhost:3001
   Acesso na Rede:  http://192.168.1.100:3001
   ```
3. O navegador abrirá automaticamente
4. Se não abrir, acesse manualmente: `http://localhost:3001`

## 🔧 Instalação Manual (Desenvolvedores)

### Pré-requisitos Adicionais
- Node.js 18+ ([download](https://nodejs.org))
- Git ([download](https://git-scm.com))

### Passo 1: Clone do Repositório
```bash
git clone https://github.com/artotaleventos/checkin-ar-system.git
cd checkin-ar-system
```

### Passo 2: Instalação Backend
```bash
cd backend
npm install
```

### Passo 3: Instalação Frontend
```bash
cd ../frontend
npm install
```

### Passo 4: Build do Frontend
```bash
npm run build
```

### Passo 5: Integração
```bash
# Copiar build para backend
cp -r dist/* ../backend/public/
```

### Passo 6: Inicialização
```bash
cd ../backend
npm start
```

## 🌐 Configuração de Rede

### Acesso Local
- URL: `http://localhost:3001`
- Apenas o computador onde está instalado

### Acesso em Rede
- URL: `http://[IP-DO-COMPUTADOR]:3001`
- Exemplo: `http://192.168.1.100:3001`
- Acessível por outros dispositivos na mesma rede

### Descobrir IP do Computador

#### Windows
1. Pressione `Win + R`
2. Digite `cmd` e pressione Enter
3. Digite `ipconfig` e pressione Enter
4. Procure por "Adaptador de Rede Wi-Fi" ou "Ethernet"
5. Anote o "Endereço IPv4"

#### Alternativa Automática
O sistema detecta e exibe automaticamente o IP na inicialização.

## 📱 Configuração PWA (Dispositivos Móveis)

### iPhone/iPad
1. Abra o **Safari**
2. Acesse `http://[IP-DO-COMPUTADOR]:3001`
3. Toque no ícone de **compartilhamento** (quadrado com seta)
4. Role para baixo e toque em **"Adicionar à Tela de Início"**
5. Personalize o nome se desejar
6. Toque em **"Adicionar"**
7. O ícone aparecerá na tela inicial

### Android
1. Abra o **Chrome**
2. Acesse `http://[IP-DO-COMPUTADOR]:3001`
3. Toque no menu (3 pontos verticais)
4. Selecione **"Adicionar à tela inicial"**
5. Confirme o nome
6. Toque em **"Adicionar"**
7. O ícone aparecerá na tela inicial

### Tablets
- Siga o mesmo processo do smartphone correspondente
- O sistema se adapta automaticamente ao tamanho da tela

## 🔒 Configuração de Firewall

### Windows Defender
Se o sistema não for acessível pela rede:

1. Abra **Configurações do Windows**
2. Vá em **Rede e Internet** → **Firewall do Windows Defender**
3. Clique em **"Permitir um aplicativo pelo firewall"**
4. Clique em **"Alterar configurações"**
5. Clique em **"Permitir outro aplicativo"**
6. Navegue até `C:\CheckinAR\CheckinAR.exe`
7. Marque **"Privada"** e **"Pública"**
8. Clique em **"OK"**

### Alternativa Rápida
Execute este comando como administrador:
```cmd
netsh advfirewall firewall add rule name="CheckinAR" dir=in action=allow protocol=TCP localport=3001
```

## 🗄️ Backup e Restauração

### Localização dos Dados
- **Banco de dados**: `C:\CheckinAR\database\checkin.db`
- **Uploads**: `C:\CheckinAR\uploads\`
- **Logs**: `C:\CheckinAR\logs\`

### Backup Manual
1. Feche o sistema
2. Copie a pasta `C:\CheckinAR\database\` para local seguro
3. Copie a pasta `C:\CheckinAR\uploads\` (se houver arquivos importantes)

### Restauração
1. Feche o sistema
2. Substitua os arquivos na pasta original
3. Reinicie o sistema

### Backup Automático (Recomendado)
Configure backup automático da pasta `C:\CheckinAR\` usando:
- Windows Backup
- Google Drive
- OneDrive
- Dropbox

## 🚨 Solução de Problemas

### Sistema não inicia
**Sintoma**: Janela fecha imediatamente
**Solução**:
1. Execute como administrador
2. Verifique se porta 3001 está livre
3. Reinstale o sistema

### Erro de porta ocupada
**Sintoma**: "Error: listen EADDRINUSE"
**Solução**:
1. Abra prompt como admin
2. Execute: `netstat -ano | findstr :3001`
3. Anote o PID
4. Execute: `taskkill /PID [número] /F`

### Não acessa pela rede
**Sintoma**: Outros dispositivos não conseguem acessar
**Solução**:
1. Verifique firewall (seção acima)
2. Confirme que estão na mesma rede
3. Teste ping: `ping [IP-DO-COMPUTADOR]`

### PWA não instala
**Sintoma**: Opção "Adicionar à tela inicial" não aparece
**Solução**:
1. Use Chrome ou Safari
2. Acesse via HTTPS ou localhost
3. Aguarde carregamento completo

### Banco corrompido
**Sintoma**: Erros de SQL ou dados perdidos
**Solução**:
1. Feche o sistema
2. Renomeie `checkin.db` para `checkin.db.backup`
3. Reinicie (criará novo banco)
4. Reimporte dados se necessário

## 📞 Suporte Técnico

### Antes de Contatar
1. Anote a mensagem de erro completa
2. Tire screenshot da tela
3. Verifique se seguiu todos os passos
4. Teste em outro navegador

### Informações Necessárias
- Versão do Windows
- Mensagem de erro
- Passos que levaram ao problema
- Screenshot (se possível)

### Contato
- **Email**: suporte@artotaleventos.com.br
- **WhatsApp**: (11) 99999-9999
- **Horário**: Segunda a Sexta, 8h às 18h

## ✅ Checklist de Instalação

### Pré-instalação
- [ ] Windows 10/11 64-bit
- [ ] 4GB RAM disponível
- [ ] 2GB espaço em disco
- [ ] Permissões de administrador
- [ ] Conexão com internet (para download)

### Durante a Instalação
- [ ] Executar como administrador
- [ ] Aceitar termos de licença
- [ ] Confirmar pasta de destino
- [ ] Aguardar conclusão completa

### Pós-instalação
- [ ] Sistema inicia automaticamente
- [ ] Navegador abre com a aplicação
- [ ] Criar primeira empresa
- [ ] Testar cadastro de pessoa
- [ ] Testar check-in
- [ ] Configurar acesso em rede (se necessário)
- [ ] Instalar PWA em dispositivos móveis

### Configuração de Rede
- [ ] Anotar IP do computador
- [ ] Configurar firewall
- [ ] Testar acesso de outro dispositivo
- [ ] Instalar PWA em tablets/smartphones

---

**✅ Instalação Concluída com Sucesso!**

Agora você pode usar o Sistema de Check-in AR Total Eventos em todos os seus eventos.

