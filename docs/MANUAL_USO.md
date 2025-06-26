# Manual de Uso - Sistema Check-in AR

## 🎯 Visão Geral

O Sistema Check-in AR é uma solução completa para controle de entrada em eventos, permitindo:
- Cadastro rápido de participantes
- Check-in digital com pulseiras
- Relatórios em tempo real
- Acesso simultâneo de múltiplos dispositivos

## 🚀 Iniciando o Sistema

### Primeira Vez
1. **Inicie o sistema** usando o atalho na área de trabalho
2. **Aguarde a inicialização** (janela preta aparecerá)
3. **Anote os endereços** mostrados na tela:
   - Local: `http://localhost:3001`
   - Rede: `http://192.168.1.XXX:3001`
4. **O navegador abrirá automaticamente**

### Próximas Vezes
- Use o atalho na área de trabalho
- Ou acesse diretamente pelo navegador

## 📋 Configuração Inicial

### 1. Primeira Empresa
Antes de usar o sistema, você deve criar pelo menos uma empresa:

1. Clique em **"Configurações"** (ícone de engrenagem)
2. Clique em **"Nova Empresa"**
3. Digite o nome da empresa
4. Clique em **"Criar"**

### 2. Configuração Multi-Dispositivo
Se você vai usar tablets ou smartphones:

1. **Anote o IP da rede** mostrado na inicialização
2. **Nos dispositivos móveis**, acesse: `http://[IP]:3001`
3. **Instale como PWA** (ver seção específica)

## 📊 Fluxo de Trabalho Recomendado

### Antes do Evento
1. **Importar lista de participantes** (Excel)
2. **Configurar estações de check-in**
3. **Testar o sistema** com alguns cadastros

### Durante o Evento
1. **Realizar check-ins** conforme chegada
2. **Monitorar relatórios** em tempo real
3. **Cadastrar participantes** de última hora

### Após o Evento
1. **Gerar relatórios finais**
2. **Exportar dados** em CSV
3. **Fazer backup** do banco de dados

## 📥 Importação de Dados

### Preparar Planilha Excel
Crie uma planilha com estas colunas **exatas**:

| nome | documento | empresa | setor |
|------|-----------|---------|-------|
| João Silva | 12345678901 | Tech Corp | TI |
| Maria Santos | 98765432100 | Design Ltd | Marketing |

**Regras Importantes:**
- **nome**: Nome completo (obrigatório)
- **documento**: Apenas números, CPF ou RG (obrigatório)
- **empresa**: Nome da empresa (obrigatório)
- **setor**: Setor/departamento (opcional)

### Processo de Importação
1. Vá em **"Importar"**
2. Clique em **"Selecionar Arquivo"**
3. Escolha sua planilha Excel (.xlsx)
4. Clique em **"Validar"** para verificar os dados
5. Revise os dados na prévia
6. Clique em **"Importar"** para confirmar

### Tratamento de Erros
- **Documentos duplicados**: Serão ignorados
- **Empresas novas**: Serão criadas automaticamente
- **Dados inválidos**: Serão destacados em vermelho

## 👤 Cadastro Manual

### Quando Usar
- Participantes de última hora
- Correção de dados
- Teste do sistema

### Processo Básico
1. Vá em **"Cadastro"**
2. Preencha os campos obrigatórios:
   - **Nome Completo**
   - **Documento (CPF/RG)**
   - **Empresa**
3. Preencha campos opcionais:
   - **Setor**
4. Clique em **"Cadastrar Pessoa"**

### Cadastro com OCR
1. Clique em **"Selecionar Imagem"**
2. Tire foto ou selecione imagem do documento
3. Aguarde o processamento OCR
4. **Confira os dados extraídos**
5. Corrija se necessário
6. Complete o cadastro

**Dicas para OCR:**
- Use boa iluminação
- Mantenha documento reto
- Evite reflexos e sombras
- Certifique-se que texto está legível

## ✅ Realizando Check-in

### Processo Padrão
1. Vá em **"Check-in"**
2. **Digite o documento** (CPF ou RG)
3. Clique em **"Buscar"**
4. **Confira os dados** da pessoa:
   - Nome
   - Empresa
   - Setor
   - Posição no grupo (ex: "1 de 5")
5. **Digite o número da pulseira**
6. Clique em **"Confirmar Check-in"**

### Validações Automáticas
- **Pessoa não encontrada**: Cadastre primeiro
- **Check-in duplicado**: Sistema impede
- **Pulseira duplicada**: Sistema impede
- **Dados incorretos**: Verifique documento

### Mensagens de Sucesso
- ✅ **Verde**: Check-in realizado com sucesso
- ⚠️ **Amarelo**: Avisos (ex: já fez check-in)
- ❌ **Vermelho**: Erros que impedem check-in

## 📊 Relatórios Gerenciais

### Tipos de Relatório

#### 1. Por Empresa
- **Gráfico de barras** com total por empresa
- **Tabela detalhada** com estatísticas
- **Taxa de check-in** por empresa

#### 2. Por Setor
- **Gráfico de pizza** com distribuição
- **Comparativo** entre setores
- **Análise de participação**

#### 3. Por Horário
- **Gráfico de linha** com check-ins ao longo do tempo
- **Picos de movimento**
- **Análise temporal**

#### 4. Detalhado
- **Lista completa** de todos os check-ins
- **Filtros avançados**
- **Busca por nome ou empresa**

### Filtros Disponíveis
- **Data início/fim**: Período específico
- **Empresa**: Filtrar por empresa
- **Setor**: Filtrar por setor
- **Status**: Com ou sem check-in

### Exportação
1. Configure os filtros desejados
2. Clique em **"Exportar CSV"**
3. Arquivo será baixado automaticamente
4. Abra no Excel para análises avançadas

## 👥 Gerenciamento de Pessoas

### Visualização
- **Estatísticas rápidas**: Total, check-ins, pendentes
- **Tabela completa** com todos os dados
- **Status visual** de cada pessoa

### Filtros de Busca
- **Nome ou documento**: Busca textual
- **Setor**: Filtrar por setor específico
- **Status**: Com ou sem check-in

### Informações Exibidas
- Nome completo
- Documento formatado
- Empresa e setor
- Status do check-in
- Número da pulseira
- Data/hora do check-in

## ⚙️ Configurações

### Gerenciar Empresas
- **Criar novas empresas**
- **Editar nomes existentes**
- **Visualizar estatísticas**
- **Controlar cadastros**

### Informações do Sistema
- Versão atual
- Estatísticas gerais
- Status da conexão

## 📱 Uso em Dispositivos Móveis

### Instalação PWA

#### iPhone/iPad
1. Abra **Safari**
2. Acesse o sistema
3. Toque no ícone de **compartilhamento**
4. Selecione **"Adicionar à Tela de Início"**
5. Confirme a instalação

#### Android
1. Abra **Chrome**
2. Acesse o sistema
3. Toque no **menu** (3 pontos)
4. Selecione **"Adicionar à tela inicial"**
5. Confirme a instalação

### Vantagens do PWA
- **Funciona offline** (dados já carregados)
- **Ícone na tela inicial**
- **Experiência nativa**
- **Notificações** (futuras versões)

### Uso Otimizado
- **Tablets**: Ideais para check-in
- **Smartphones**: Bons para consultas rápidas
- **Orientação**: Sistema adapta automaticamente

## 🔄 Cenários de Uso

### Evento Pequeno (até 100 pessoas)
- **1 operador** no check-in
- **1 dispositivo** (computador ou tablet)
- **Importação prévia** recomendada

### Evento Médio (100-500 pessoas)
- **2-3 operadores** simultâneos
- **Múltiplos dispositivos** (tablets/smartphones)
- **Importação obrigatória**
- **Monitor de relatórios** em tempo real

### Evento Grande (500+ pessoas)
- **4+ operadores** em estações separadas
- **Tablets dedicados** para check-in
- **Computador central** para relatórios
- **Backup de dados** durante evento

### Evento Corporativo
- **Separação por empresas**
- **Relatórios por setor**
- **Controle de acesso** por área
- **Integração com crachás**

## 🚨 Solução de Problemas

### Problemas Comuns

#### "Pessoa não encontrada"
**Causa**: Documento não cadastrado
**Solução**: 
1. Verifique se digitou corretamente
2. Cadastre a pessoa manualmente
3. Verifique se importação foi completa

#### "Pulseira já utilizada"
**Causa**: Número de pulseira duplicado
**Solução**:
1. Verifique se pessoa já fez check-in
2. Use outro número de pulseira
3. Consulte relatório de check-ins

#### "Sistema lento"
**Causa**: Muitos acessos simultâneos
**Solução**:
1. Feche abas desnecessárias
2. Reinicie o navegador
3. Verifique conexão de rede

#### "Não consegue acessar de outro dispositivo"
**Causa**: Problema de rede ou firewall
**Solução**:
1. Verifique se estão na mesma rede
2. Confirme o IP correto
3. Verifique firewall do Windows

### Dicas de Performance
- **Feche abas** não utilizadas
- **Use Chrome ou Safari** para melhor performance
- **Evite muitos filtros** simultâneos nos relatórios
- **Faça backup** regularmente

## 📈 Boas Práticas

### Antes do Evento
- [ ] Teste o sistema com dados reais
- [ ] Configure todas as estações
- [ ] Treine a equipe
- [ ] Prepare pulseiras numeradas
- [ ] Faça backup dos dados

### Durante o Evento
- [ ] Monitore relatórios regularmente
- [ ] Mantenha pulseiras organizadas
- [ ] Cadastre participantes extras imediatamente
- [ ] Comunique problemas rapidamente

### Após o Evento
- [ ] Gere relatório final
- [ ] Exporte dados em CSV
- [ ] Faça backup completo
- [ ] Documente lições aprendidas

## 📞 Suporte

### Auto-Diagnóstico
1. **Reinicie o navegador**
2. **Teste em outro dispositivo**
3. **Verifique conexão de rede**
4. **Consulte este manual**

### Contato Técnico
- **Email**: suporte@artotaleventos.com.br
- **WhatsApp**: (11) 99999-9999
- **Horário**: Segunda a Sexta, 8h às 18h

### Informações para Suporte
- Versão do sistema
- Tipo de dispositivo
- Navegador utilizado
- Mensagem de erro (screenshot)
- Passos que causaram o problema

---

**🎉 Pronto para usar o Sistema Check-in AR!**

Com este manual, você tem todas as informações necessárias para operar o sistema com eficiência e segurança em seus eventos.

