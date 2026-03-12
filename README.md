# CRIADOR DE PROJETOS

Sistema automatizado para criar projetos com estrutura profissional usando Claude Code.

---

## O que é

Quando você diz ao Claude Code frases como "criar um projeto", "novo projeto", ou "quero criar", ele ativa automaticamente este sistema e cria toda a estrutura do projeto para você — pasta, arquivos de memória, CLAUDE.md, Git local e repositório privado no GitHub.

---

## Como ativar

Diga qualquer uma dessas frases no Claude Code:

- "cria um projeto..."
- "novo projeto..."
- "quero criar..."
- "desenvolve um sistema..."
- "preciso de um..."
- "monta um..."
- "faz um app..."

---

## O que é criado em cada projeto

| Arquivo | O que faz |
|---------|-----------|
| `ARQUITETURA-MENTAL.md` | Como o Claude processa informação neste projeto |
| `CLAUDE.md` | Instruções do projeto (memória, nomenclatura, comunicação) |
| `.memoria-ultimas-tarefas.md` | As 3 tarefas mais recentes — leia primeiro |
| `.memoria-do-dia.md` | Log cronológico do dia |
| `.memoria-projeto.md` | Memória completa do projeto |
| `README.md` | Documentação de uso |
| `.gitignore` | Arquivos a ignorar no Git |

---

## Arquivos desta pasta

| Arquivo | O que é |
|---------|---------|
| `AGENTE.md` | O protocolo completo do agente criador |
| `REGRA-ATIVACAO.md` | Triggers de ativação automática |
| `ARQUITETURA-MENTAL.md` | Padrão mental (copiado para cada projeto) |
| `templates/CLAUDE.md` | Template do CLAUDE.md para novos projetos |
| `templates/.memoria-ultimas-tarefas.md` | Template de memória de curto prazo |
| `templates/.memoria-do-dia.md` | Template do log diário |

---

## Instalacao

### Forma 1 — Script (recomendado)

Abra o Terminal e rode:

```bash
git clone https://github.com/Hackerdomarketing/criador-de-projetos-no-claude-code.git
cd criador-de-projetos-no-claude-code
chmod +x instalar.sh && ./instalar.sh
```

O script copia tudo para `~/.claude/skills/criador-de-projetos/`. O Claude Code detecta automaticamente.

### Forma 2 — Pelo Claude Code (zero terminal)

Abra o Claude Code e diga:

```
Clona o repo https://github.com/Hackerdomarketing/criador-de-projetos-no-claude-code
e copia todos os arquivos para ~/.claude/skills/criador-de-projetos/
```

---

## Atualizacao

Se voce ja tem instalado e quer pegar a versao mais recente:

```bash
cd criador-de-projetos-no-claude-code
git pull
./instalar.sh
```

O script detecta que ja existe e faz a atualizacao automaticamente.

---

## Pre-requisitos

- [Claude Code](https://github.com/anthropics/claude-code) instalado
- [GitHub CLI](https://cli.github.com/) instalado e autenticado (`gh auth login`)
- macOS (ou adaptar os caminhos para Windows/Linux)
