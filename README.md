# CRIADOR DE PROJETOS — Claude Code (qualquer interface)

Ensina o Claude Code a criar projetos completos automaticamente quando você pede.

Você diz "quero criar um app de controle financeiro" — e ele cria a pasta, os arquivos, conecta ao GitHub e organiza tudo. Sem você precisar fazer nada manualmente.

> **Versão para:** Terminal, Claude Desktop App, ou qualquer interface com Claude Code.
> Se você usa o **VS Code com a extensão Claude**, use este outro repositório:
> https://github.com/Hackerdomarketing/criador-de-projetos-claude-code-no-vscode

---

## O que você precisa ter instalado antes

Antes de instalar, confirme que você já tem estes 3 programas:

**1. Claude Code**
A ferramenta da Anthropic que você usa no terminal. Instale em: https://github.com/anthropics/claude-code

**2. Node.js**
Necessário para o Claude Code funcionar. Baixe em: https://nodejs.org (versão LTS)

**3. GitHub CLI (`gh`)**
Ferramenta de terminal que permite criar repositórios no GitHub automaticamente.

Para verificar se já está instalado, abra o Terminal e digite:
```
gh --version
```
Se aparecer um número de versão, está instalado. Se não aparecer, instale com:
```
brew install gh
```
Depois, conecte ao GitHub (só precisa fazer uma vez):
```
gh auth login
```
Siga as instruções na tela. Escolha GitHub.com → HTTPS → autentique com o navegador.

---

## Como baixar e instalar

### Passo 1 — Baixar este repositório

No Terminal, cole este comando e pressione Enter:

```
cd ~/Downloads && git clone https://github.com/Hackerdomarketing/criador-de-projetos-no-claude-code.git
```

Isso vai criar uma pasta chamada `criador-de-projetos-no-claude-code` nos seus Downloads.

### Passo 2 — Abrir a pasta no Terminal

```
cd ~/Downloads/criador-de-projetos-no-claude-code
```

### Passo 3 — Rodar o instalador

```
bash instalar.sh
```

O instalador vai perguntar em qual pasta você quer guardar seus projetos.
Se não souber o que responder, pressione Enter — ele vai usar `~/projetos/` como padrão.

O instalador vai:
- Criar a pasta `[sua pasta]/CRIADOR-DE-PROJETOS/` com todos os arquivos
- Criar o arquivo `[sua pasta]/CLAUDE.md` com as instruções do sistema (se você ainda não tiver)

---

## Como usar depois de instalar

**Abra o Terminal** na pasta onde seus projetos ficam (ex: `~/projetos/`).

**Inicie o Claude Code** digitando `claude` no terminal.

**Diga qualquer uma dessas frases:**

> "criar um projeto..."
> "novo projeto..."
> "quero criar..."
> "faz um app..."
> "preciso de um sistema..."
> "monta um..."

O Claude vai perguntar algumas coisas (o que o projeto faz, qual tecnologia, etc.) e depois criar tudo automaticamente — pasta, arquivos de memória, código inicial, Git e repositório privado no GitHub.

---

## O que é criado em cada projeto

Toda vez que você pede um projeto novo, o Claude cria estes arquivos automaticamente:

| Arquivo | Para que serve |
|---------|---------------|
| `ARQUITETURA-MENTAL.md` | Como o Claude pensa e processa informação neste projeto |
| `CLAUDE.md` | Instruções do projeto — memória, comunicação, nomenclatura |
| `.memoria-ultimas-tarefas.md` | As 3 últimas tarefas feitas (o Claude lê isso primeiro a cada sessão) |
| `.memoria-do-dia.md` | Registro cronológico do que foi feito hoje |
| `.memoria-projeto.md` | Memória completa do projeto |
| `README.md` | Documentação básica do projeto |
| `.gitignore` | Lista de arquivos que não vão para o GitHub |

---

## Dúvidas frequentes

**Preciso abrir o terminal em alguma pasta específica?**
Sim. Abra o terminal (e inicie `claude`) na pasta onde seus projetos ficam — a mesma que você escolheu na instalação (ex: `~/projetos/`). Assim os projetos são criados no lugar certo.

**O que acontece se eu já tiver um CLAUDE.md?**
O instalador não apaga o que você já tem. Você pode copiar manualmente o conteúdo de `templates/CLAUDE.md` para o seu CLAUDE.md existente.

**Funciona só no Mac?**
Por enquanto sim. Os caminhos (`~/projetos/`) são padrão no macOS. No Windows ou Linux, os caminhos são diferentes.

**O repositório criado no GitHub é privado ou público?**
Sempre privado. Só você vê.
