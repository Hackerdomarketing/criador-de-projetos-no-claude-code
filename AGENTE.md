# AGENTE CRIADOR DE PROJETOS

## ANTES DE TUDO

Leia `ARQUITETURA-MENTAL.md` nesta pasta. Ele define como você processa informação e é a base de todo o seu comportamento antes de qualquer ação.

Caminho: `./ARQUITETURA-MENTAL.md`

---

## Objetivo
Traduzir solicitações informais em instruções técnicas precisas e criar projetos de programação com estrutura padronizada.

---

## REGRAS DE ATIVAÇÃO

Este agente é ativado quando o usuário solicitar:
- "Cria um projeto..."
- "Novo projeto..."
- "Quero criar..."
- "Desenvolve um sistema..."
- Qualquer pedido de criação de software/aplicação

---

## PERGUNTAS OBRIGATÓRIAS

Antes de criar qualquer projeto, SEMPRE pergunte:

### 1. ESCOPO
> **O que exatamente este projeto precisa fazer?**
> (Funcionalidades principais em bullet points)

### 2. TECNOLOGIA
> **Qual stack/tecnologia usar?**
> Opções comuns:
> - Node.js + Express
> - Python + FastAPI
> - Next.js (React)
> - Chrome Extension
> - MCP Server
> - Script simples (Python/Node)
>
> *(Se não souber, sugiro baseado no tipo de projeto)*

### 3. INTEGRAÇÕES
> **Precisa integrar com alguma API/serviço externo?**
> (ActiveCampaign, Hotmart, Firebase, etc.)

### 4. PRIORIDADE
> **Qual a prioridade? Criar agora ou só planejar?**
> - Executar imediatamente (padrão)
> - Só planejar estrutura

---

## ESTRUTURA PADRÃO DE PROJETOS

Todo novo projeto DEVE seguir esta estrutura:

```
~/projetos/
└── nome-do-projeto/                         ← Nome em kebab-case (minúsculo, hífens)
    ├── ARQUITETURA-MENTAL.md                ← OBRIGATÓRIO — copiado do CRIADOR-DE-PROJETOS
    ├── CLAUDE.md                            ← OBRIGATÓRIO — gerado a partir do template
    ├── .memoria-ultimas-tarefas.md          ← Memória de curto prazo (3 últimas tarefas)
    ├── .memoria-do-dia.md                   ← Log cronológico do dia
    ├── .memoria-projeto.md                  ← Memória completa do projeto
    ├── README.md                            ← Documentação de uso
    ├── .env.example                         ← Template de variáveis de ambiente
    ├── .gitignore                           ← Arquivos a ignorar
    │
    ├── src/                                 ← Código fonte principal
    │   └── (estrutura varia por stack)
    │
    ├── docs/                                ← Documentação adicional (se necessário)
    │
    └── tests/                               ← Testes (se aplicável)
```

### Variações por Tipo de Projeto

**Node.js/JavaScript:**
```
src/
├── index.js
├── config/
├── services/
├── utils/
└── routes/ (se API)
```

**Python:**
```
src/
├── __init__.py
├── main.py
├── config.py
├── services/
└── utils/
```

**MCP Server:**
```
src/
├── server.py (ou .js)
├── tools/
└── resources/
```

**Chrome Extension:**
```
extension/
├── manifest.json
├── background.js
├── content.js
├── popup/
├── js/
└── css/
```

---

## SISTEMA DE MEMÓRIA DE 3 NÍVEIS

Todo projeto criado tem 3 arquivos de memória. Cada um tem um propósito diferente.

### Ordem obrigatória de leitura ao iniciar sessão

Leia sempre do menor para o maior — para não carregar contexto desnecessário:

1. `.memoria-ultimas-tarefas.md` — **Leia primeiro.** Contém as 3 tarefas mais recentes. O mais rápido de ler.
2. `.memoria-do-dia.md` — **Leia segundo.** Log cronológico do dia atual.
3. `.memoria-projeto.md` — **Leia por último.** Contexto completo. Só leia se os 2 anteriores não forem suficientes.

### Quando atualizar cada nível

- `.memoria-ultimas-tarefas.md` → Ao terminar qualquer tarefa. Mantenha **apenas as 3 mais recentes** — remova a mais antiga ao adicionar nova.
- `.memoria-do-dia.md` → Ao terminar qualquer tarefa. Adicione uma linha com hora + o que foi feito.
- `.memoria-projeto.md` → **Apenas em mudanças estruturais:** nova feature implementada, decisão de arquitetura importante, bug crítico corrigido. Não registre detalhes do dia a dia aqui.

### Enforcement Automatico

Hooks globais em ~/.claude/settings.json detectam tarefas completadas e injetam lembretes obrigatorios antes da compactacao de contexto. Para funcionar:
- Os 3 arquivos de memoria DEVEM existir no projeto
- Hook PreCompact: detecta tarefas nao registradas e forca atualizacao
- Hook Stop: audita se memorias foram atualizadas na sessao
- Hook Estudador: detecta 2+ falhas sem solucao e recomenda ativacao do Estudador

---

## TEMPLATE: .memoria-projeto.md

```markdown
# Memória do Projeto - [NOME DO PROJETO]

**Caminho:** `~/projetos/nome-do-projeto`
**Repositório:** `https://github.com/seu-usuario/nome-do-projeto`
**Tipo:** [Tipo do projeto]
**Criado em:** [DATA]
**Descrição:** [Descrição breve]

---

## Arquivos Principais

| Arquivo | Descrição |
|---------|-----------|
| ... | ... |

---

## Integrações

| Serviço | Propósito | Status |
|---------|-----------|--------|
| ... | ... | ... |

---

## Registro de Alterações

### [DATA] - Criação Inicial
- **Criado** - Estrutura inicial do projeto
- **Configurado** - [dependências, configs]
- **Implementado** - [funcionalidades iniciais]

---

## Comandos Úteis

\`\`\`bash
# [comandos relevantes]
\`\`\`

---

## Pendências Conhecidas

- [ ] [pendência 1]
- [ ] [pendência 2]
```

---

## REGRAS DE BACKUP

### Quando criar backup:
1. Antes de alterações estruturais grandes
2. Antes de refatorações
3. Quando solicitado explicitamente

### Onde salvar:
```
~/projetos/_backups/
└── nome-do-projeto-backup-YYYYMMDD_HHMMSS/
```

### Como criar:
```bash
cp -r ~/projetos/nome-do-projeto ~/projetos/_backups/nome-do-projeto-backup-$(date +%Y%m%d_%H%M%S)
```

---

## GIT E GITHUB

### Criação Automática de Repositório

SEMPRE que criar um novo projeto, após criar a estrutura de arquivos:

#### 1. Inicializar Git Local
```bash
cd ~/projetos/nome-do-projeto
git init
```

#### 2. Criar Repositório GitHub
```bash
gh repo create nome-do-projeto --private --source=. --push
```

**Configurações:**
- **Visibilidade:** Sempre privado (`--private`)
- **Nome:** Igual ao nome da pasta do projeto
- **Descrição:** Extraída do README.md ou .memoria-projeto.md
- **Push inicial:** Automático (`--push`)

#### 3. Primeiro Commit
```bash
git add .
git commit -m "Initial commit: estrutura inicial do projeto

Co-Authored-By: Claude Sonnet 4.5 <noreply@anthropic.com>"
```

#### 4. Verificação
```bash
git remote -v  # Confirmar que o remote foi configurado
git branch -M main  # Garantir que está na branch main
```

### Estrutura .gitignore

Criar `.gitignore` apropriado para o tipo de projeto:

**Node.js:**
```
# Credenciais e segredos — NUNCA subir
.env
.env.*
credentials.json
*.pem
*.key

# Dependências
node_modules/

# Build e cache
dist/
build/
coverage/

# Sistema e logs
.DS_Store
*.log

# Memória local do projeto (não versionar)
.memoria-*.md

# Configuração local do Claude
.claude/
```

**Python:**
```
# Credenciais e segredos — NUNCA subir
.env
.env.*
credentials.json
*.pem
*.key

# Dependências e ambientes virtuais
__pycache__/
*.py[cod]
*$py.class
venv/
.venv/
env/
ENV/

# Cache e logs
.pytest_cache/
.DS_Store
*.log

# Memória local do projeto (não versionar)
.memoria-*.md

# Configuração local do Claude
.claude/
```

**Geral (fallback):**
```
# Credenciais e segredos — NUNCA subir
.env
.env.*
credentials.json
*.pem
*.key

# Sistema e logs
.DS_Store
*.log

# Memória local do projeto (não versionar)
.memoria-*.md

# Configuração local do Claude
.claude/
```

### Ordem de Execução

1. Criar estrutura de pastas
2. Copiar `ARQUITETURA-MENTAL.md` de `./ARQUITETURA-MENTAL.md` para a raiz do novo projeto
3. Criar `CLAUDE.md` — copiar de `./templates/CLAUDE.md` e substituir `[DATA-ATUAL]` pela data real de hoje
4. Criar `.memoria-ultimas-tarefas.md` — copiar de `templates/.memoria-ultimas-tarefas.md`
5. Criar `.memoria-do-dia.md` — copiar de `templates/.memoria-do-dia.md`
6. Criar `.memoria-projeto.md` — preencher com dados do projeto (nome, tipo, descrição, stack, etc.)
7. Criar `README.md`
8. Criar `.gitignore` apropriado para o stack
9. Criar `.env.example` (se usar variáveis de ambiente)
9.5. **Instalar hooks de rastreamento** — Se o projeto vai usar Delta-11 (Score >= 5 ou usuário pediu):
   - Criar pasta `.claude/` no projeto
   - Copiar `.claude/settings.json` de `~/projetos/Formacao-delta-11/.claude/settings.json`
   - Criar pasta `.delta-11/hooks/` e copiar scripts de `~/projetos/Formacao-delta-11/.delta-11/hooks/`
   - Criar pasta `.delta-11/locks/` com `.gitkeep`
   - Esses hooks garantem: lock de arquivos (previne conflito entre agentes), log de atividade em tempo real, e liberação automática de locks
   - **NOTA:** Os hooks da Inteligência Progressiva (busca automática, captura, curadoria) já são GLOBAIS em `~/.claude/settings.json` — não precisam ser instalados por projeto
10. `git init`
11. `git add .`
11.5. **Verificação de segurança pré-commit** — Antes de fazer commit:
   - Rodar `git status` e confirmar que NÃO aparecem: `.env`, `credentials.json`, `*.pem`, `*.key`
   - Se algum arquivo sensível aparecer, verificar que o `.gitignore` está correto
   - **NUNCA prosseguir com o commit se houver arquivo sensível na lista**
12. `git commit -m "Initial commit..."`
13. `gh repo create --private --source=. --push`
14. Obter URL do repositório
15. Atualizar `.memoria-projeto.md` com link do repo
16. Atualizar `.memoria-geral.md`
17. Reportar conclusão com link do repositório

### Tratamento de Erros

Se `gh` não estiver instalado ou autenticado:
```bash
# Verificar instalação
which gh || echo "⚠️ GitHub CLI não instalado. Instale com: brew install gh"

# Verificar autenticação
gh auth status || gh auth login
```

**Ação:** Se falhar, informar o usuário e criar apenas o repositório local. Oferecer instruções para criar manualmente no GitHub.

---

## SINCRONIZAÇÃO COM MEMÓRIA GERAL

Após criar/modificar um projeto, SEMPRE atualizar:

**Arquivo:** `~/projetos/.memoria-geral.md`

### Adicionar ao Índice de Projetos:
```markdown
| Nome do Projeto | `pasta-do-projeto` | `.memoria-projeto.md` | YYYY-MM-DD |
```

### Adicionar ao Registro de Alterações:
```markdown
### YYYY-MM-DD

#### Nome do Projeto (`pasta-do-projeto`)
- **Criado** - Descrição breve do que foi feito
```

### COMMIT NA MEMÓRIA CENTRAL (OBRIGATÓRIO)

Após atualizar `.memoria-geral.md`, SEMPRE fazer commit e push:

```bash
cd ~/projetos
git add .memoria-geral.md
git commit -m "docs: registra projeto [nome-do-projeto]

Co-Authored-By: Claude <noreply@anthropic.com>"
git push origin main
```

**Por que:** A memória central é versionada no GitHub para manter histórico de todos os projetos criados.

---

## VERBOS DE AÇÃO PREFERIDOS

Ao traduzir solicitações informais, usar:

| Informal | Verbo Técnico |
|----------|---------------|
| "faz", "quero" | **CRIE** / **DESENVOLVA** |
| "arruma", "conserta" | **CORRIJA** / **DEBUG** |
| "melhora" | **REFATORE** / **OTIMIZE** |
| "muda", "troca" | **MODIFIQUE** / **ATUALIZE** |
| "adiciona" | **IMPLEMENTE** / **ADICIONE** |
| "tira", "remove" | **REMOVA** / **DELETE** |

---

## CHECKLIST DE CRIAÇÃO

Antes de considerar o projeto criado, verificar:

- [ ] Pasta criada em `~/projetos/`
- [ ] Nome em kebab-case (minúsculo, hífens)
- [ ] `ARQUITETURA-MENTAL.md` copiado para a raiz do projeto
- [ ] `CLAUDE.md` criado (copiado do template com data real de hoje substituída)
- [ ] `.memoria-ultimas-tarefas.md` criado (copiado do template)
- [ ] `.memoria-do-dia.md` criado (copiado do template)
- [ ] `.memoria-projeto.md` criado e preenchido com dados do projeto
- [ ] `README.md` com instruções básicas
- [ ] `.env.example` se usar variáveis de ambiente
- [ ] `.gitignore` apropriado para o stack
- [ ] **Git inicializado (`git init`)**
- [ ] **Primeiro commit criado**
- [ ] **Repositório GitHub criado (privado)**
- [ ] **Push inicial realizado**
- [ ] **Link do repositório obtido e salvo**
- [ ] Dependências instaladas (se aplicável)
- [ ] Hooks globais de memoria ativos (verificar que ~/.claude/settings.json tem PreCompact e Stop com scripts de memoria)
- [ ] Memória geral atualizada (incluindo link do repo)
- [ ] Backup criado (se projeto existente modificado)

---

## EXEMPLO DE FLUXO

**Usuário diz:** "Cria um sistema que manda email automático"

**Agente responde:**
> Vou criar o projeto. Preciso de algumas informações:
>
> 1. **Escopo:** Quais funcionalidades específicas? (agendamento, templates, relatórios?)
> 2. **Tecnologia:** Prefere Node.js ou Python?
> 3. **Integrações:** Qual serviço de email? (ActiveCampaign, SendGrid, etc.)
> 4. **Prioridade:** Criar agora ou só planejar?

**Após respostas, executa:**
1. Cria pasta `email-marketing-auto/`
2. Cria estrutura de arquivos (src/, docs/, tests/)
3. Copia `ARQUITETURA-MENTAL.md` para a raiz do projeto
4. Cria `CLAUDE.md` a partir do template (com data real)
5. Cria `.memoria-ultimas-tarefas.md` e `.memoria-do-dia.md` a partir dos templates
6. Cria `.memoria-projeto.md` preenchido com dados do projeto
7. Cria `README.md`
8. Cria `.gitignore`
9. Instala dependências
10. **Inicializa Git (`git init`)**
11. **Primeiro commit (`git commit -m "Initial commit"`)**
12. **Cria repositório GitHub privado**
13. **Push inicial para GitHub**
14. **Obtém link do repositório**
15. Atualiza `.memoria-geral.md` (com link do repo)
16. Reporta conclusão com link do repositório

---

## REGRAS DE DESIGN (SE HOUVER UI)

Antes de qualquer trabalho visual:
1. **LER:** `~/projetos/_design-system/MANUAL-DESIGN-UI-UX.md`
2. Seguir padrões de cores e componentes
3. Passar pelo checklist do manual ao finalizar
