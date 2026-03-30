---
name: criador-de-projetos
description: |
  Sistema automatizado para criar projetos com estrutura profissional, memoria de 3 niveis, rules modulares, Git e GitHub.

  Use quando precisar:
  1. Criar um novo projeto de software do zero
  2. Montar estrutura de pastas para um novo sistema
  3. Inicializar projeto com Git e repositorio GitHub privado
  4. Criar projeto com memoria persistente, CLAUDE.md e rules padronizados
  5. Saber onde colocar arquivos ou como organizar um projeto

  O que instala:
  - Rules globais em ~/.claude/rules/ (comunicacao, seguranca, nomenclatura, comandos destrutivos)
  - Rules por projeto em .claude/rules/ (memoria, seguranca-github, ambiente)
  - Templates de CLAUDE.md, memorias e ARQUITETURA-MENTAL.md

  Palavras-chave: cria um projeto, novo projeto, criar um sistema, desenvolve um, quero criar, faz um app, preciso de um, monta um, onde coloco, qual pasta, como organizo, estrutura de pastas, criar projeto, criador de projetos.
---

## Verificacao de Instalacao (executar em silencio)

Antes de usar esta skill, verifique se a instalacao esta completa:
1. Leia o arquivo ~/.claude/CLAUDE.md e procure a secao "## CRIADOR DE PROJETOS"
2. Se a secao EXISTIR: prossiga normalmente sem mencionar nada ao usuario
3. Se a secao NAO existir: a skill nao foi instalada corretamente. Avise o usuario:
   "Esta skill ainda nao foi instalada completamente. Para funcionar direitinho, rode este comando no terminal:
   git clone https://github.com/Hackerdomarketing/criador-de-projetos-no-claude-code.git /tmp/criador && cd /tmp/criador && chmod +x instalar.sh && ./instalar.sh
   Me diz quando fizer."
   NAO prossiga ate o usuario confirmar que instalou.

# Criador de Projetos

## Visao Geral

Traduz solicitacoes informais em projetos completos com estrutura padronizada, sistema de memoria de 3 niveis, Git local e repositorio privado no GitHub.

## Ativacao

Ao detectar que o usuario quer criar um projeto (frases como "cria um projeto", "novo projeto", "quero criar", "faz um app", "monta um sistema", etc.), siga os passos abaixo.

## Fluxo de Trabalho

### Passo 1: Carregar Protocolo

Leia os arquivos do CRIADOR-DE-PROJETOS nesta ordem:

1. **ARQUITETURA-MENTAL.md** (ler primeiro — define como processar informacao):
   `ARQUITETURA-MENTAL.md` (na pasta do criador de projetos)

2. **AGENTE.md** (protocolo completo do agente criador):
   `AGENTE.md` (na pasta do criador de projetos)

### Passo 2: Perguntas Obrigatorias

Antes de criar qualquer projeto, SEMPRE pergunte:

1. **ESCOPO** — O que exatamente este projeto precisa fazer?
2. **TECNOLOGIA** — Qual stack/tecnologia usar?
3. **INTEGRACOES** — Precisa integrar com alguma API/servico externo?
4. **PRIORIDADE** — Criar agora ou so planejar?

### Passo 3: Criar Estrutura

Seguir a ordem de execucao completa do AGENTE.md:

1. Criar pasta em `~/Documents/VSCODE/nome-do-projeto/` (kebab-case)
2. Copiar `ARQUITETURA-MENTAL.md` do CRIADOR-DE-PROJETOS para raiz do novo projeto
3. Criar `CLAUDE.md` a partir do template em `templates/CLAUDE.md`
4. Criar `.claude/rules/` com rules do projeto (copiar de `templates/rules-projeto/`)
5. Criar `.memoria-ultimas-tarefas.md` a partir do template
6. Criar `.memoria-do-dia.md` a partir do template
7. Criar `.memoria-projeto.md` preenchido com dados do projeto
8. Criar `README.md`
9. Criar `.gitignore` apropriado para o stack
10. Criar `.env.example` (se aplicavel)
11. `git init` + primeiro commit
12. `gh repo create --private --source=. --push`
13. Atualizar `.memoria-projeto.md` com link do repo
14. Atualizar `.memoria-geral.md` na raiz do workspace

### Passo 4: Verificacao

Conferir checklist completo do AGENTE.md antes de considerar o projeto criado.

## Arquivos de Referencia

| Arquivo | Caminho |
|---------|---------|
| Protocolo do Agente | `AGENTE.md` |
| Arquitetura Mental | `ARQUITETURA-MENTAL.md` |
| Regras de Ativacao | `REGRA-ATIVACAO.md` |
| Template CLAUDE.md | `templates/CLAUDE.md` |
| Template Tarefas | `templates/.memoria-ultimas-tarefas.md` |
| Template Dia | `templates/.memoria-do-dia.md` |
| Memoria Geral | `.memoria-geral.md` (na raiz do workspace) |
| Design System | `_design-system/MANUAL-DESIGN-UI-UX.md` (na raiz do workspace) |
