#!/bin/bash

# ═══════════════════════════════════════════════════════════════
# CRIADOR DE PROJETOS — Script de Instalacao / Atualizacao
# ═══════════════════════════════════════════════════════════════
#
# O que este script faz:
# 1. Copia todos os arquivos para ~/.claude/skills/criador-de-projetos/
# 2. O Claude Code detecta automaticamente a skill
#
# Como usar:
#   chmod +x instalar.sh && ./instalar.sh
#
# Para atualizar:
#   git pull && ./instalar.sh
#
# ═══════════════════════════════════════════════════════════════

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m'

SKILL_DIR="$HOME/.claude/skills/criador-de-projetos"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo ""
echo -e "${CYAN}═══════════════════════════════════════════════════${NC}"
echo -e "${BOLD}     CRIADOR DE PROJETOS — Instalacao${NC}"
echo -e "${CYAN}═══════════════════════════════════════════════════${NC}"
echo ""

# ─── Detectar se e instalacao ou atualizacao ─────────────────

if [ -f "$SKILL_DIR/SKILL.md" ]; then
    MODO="atualizacao"
    echo -e "${YELLOW}Modo:${NC} Atualizacao (skill ja existe)"
else
    MODO="instalacao"
    echo -e "${YELLOW}Modo:${NC} Instalacao nova"
fi
echo ""

# ─── PASSO 1: Copiar arquivos da skill ──────────────────────

echo -e "${YELLOW}[1/4]${NC} Copiando arquivos da skill..."

mkdir -p "$SKILL_DIR"
mkdir -p "$SKILL_DIR/templates"
mkdir -p "$SKILL_DIR/templates/rules-globais"
mkdir -p "$SKILL_DIR/templates/rules-projeto"

# Copiar arquivos principais
cp "$SCRIPT_DIR/SKILL.md" "$SKILL_DIR/SKILL.md"
cp "$SCRIPT_DIR/AGENTE.md" "$SKILL_DIR/AGENTE.md"
cp "$SCRIPT_DIR/ARQUITETURA-MENTAL.md" "$SKILL_DIR/ARQUITETURA-MENTAL.md"
cp "$SCRIPT_DIR/REGRA-ATIVACAO.md" "$SKILL_DIR/REGRA-ATIVACAO.md"

# Copiar templates
if [ -f "$SCRIPT_DIR/templates/CLAUDE.md" ]; then
    cp "$SCRIPT_DIR/templates/CLAUDE.md" "$SKILL_DIR/templates/CLAUDE.md"
fi

# Copiar templates de rules globais
if [ -d "$SCRIPT_DIR/templates/rules-globais" ]; then
    cp "$SCRIPT_DIR/templates/rules-globais/"*.md "$SKILL_DIR/templates/rules-globais/" 2>/dev/null || true
fi

# Copiar templates de rules de projeto
if [ -d "$SCRIPT_DIR/templates/rules-projeto" ]; then
    cp "$SCRIPT_DIR/templates/rules-projeto/"*.md "$SKILL_DIR/templates/rules-projeto/" 2>/dev/null || true
fi

echo -e "  ${GREEN}✓${NC} Arquivos copiados para $SKILL_DIR"
echo ""

# ─── PASSO 2: Instalar rules globais ──────────────────────────

echo -e "${YELLOW}[2/4]${NC} Instalando rules globais em ~/.claude/rules/..."

RULES_DIR="$HOME/.claude/rules"
mkdir -p "$RULES_DIR"

RULES_INSTALADOS=0
for RULE_FILE in "$SCRIPT_DIR/templates/rules-globais/"*.md; do
    if [ -f "$RULE_FILE" ]; then
        RULE_NAME=$(basename "$RULE_FILE")
        if [ ! -f "$RULES_DIR/$RULE_NAME" ]; then
            cp "$RULE_FILE" "$RULES_DIR/$RULE_NAME"
            echo -e "  ${GREEN}✓${NC} $RULE_NAME instalado"
            RULES_INSTALADOS=$((RULES_INSTALADOS + 1))
        else
            echo -e "  ${YELLOW}→${NC} $RULE_NAME ja existe (mantido)"
        fi
    fi
done

if [ $RULES_INSTALADOS -eq 0 ]; then
    echo -e "  ${GREEN}✓${NC} Rules globais ja estavam instalados"
fi
echo ""

# ─── PASSO 3: Configurar triggers no CLAUDE.md global ────────

echo -e "${YELLOW}[3/4]${NC} Configurando triggers no CLAUDE.md global..."

CLAUDE_MD="$HOME/.claude/CLAUDE.md"

if [ ! -f "$CLAUDE_MD" ]; then
    touch "$CLAUDE_MD"
fi

if ! grep -q "## CRIADOR DE PROJETOS" "$CLAUDE_MD" 2>/dev/null; then
    cat >> "$CLAUDE_MD" << 'TRIGGER_BLOCK'


## CRIADOR DE PROJETOS

Quando o usuario usar qualquer uma destas frases, ative a skill `criador-de-projetos`:

**Triggers de criacao:**
- "cria um projeto", "novo projeto", "criar um sistema", "desenvolve um"
- "quero criar", "faz um app", "preciso de um", "monta um"

**Triggers de estrutura:**
- "onde coloco", "qual pasta", "como organizo", "estrutura de pastas"

**Acao:** Usar a skill `criador-de-projetos` que carrega o protocolo completo.
TRIGGER_BLOCK
    echo -e "  ${GREEN}✓${NC} Triggers configurados no CLAUDE.md"
else
    echo -e "  ${GREEN}✓${NC} Triggers ja estavam configurados"
fi

echo ""

# ─── PASSO 4: Verificar instalacao ──────────────────────────

echo -e "${YELLOW}[4/4]${NC} Verificando..."

ERROS=0

echo -e "  ${BOLD}Skill:${NC}"
for ARQUIVO in SKILL.md AGENTE.md ARQUITETURA-MENTAL.md REGRA-ATIVACAO.md; do
    if [ -f "$SKILL_DIR/$ARQUIVO" ]; then
        echo -e "  ${GREEN}✓${NC} $ARQUIVO"
    else
        echo -e "  ${RED}✗${NC} $ARQUIVO nao encontrado"
        ERROS=$((ERROS + 1))
    fi
done

if [ -f "$SKILL_DIR/templates/CLAUDE.md" ]; then
    echo -e "  ${GREEN}✓${NC} templates/CLAUDE.md"
else
    echo -e "  ${YELLOW}⚠${NC} templates/CLAUDE.md (opcional)"
fi

echo ""
echo -e "  ${BOLD}Rules globais (~/.claude/rules/):${NC}"
for RULE in comunicacao.md seguranca.md nomenclatura.md comandos-destrutivos.md; do
    if [ -f "$RULES_DIR/$RULE" ]; then
        echo -e "  ${GREEN}✓${NC} $RULE"
    else
        echo -e "  ${YELLOW}⚠${NC} $RULE nao encontrado"
    fi
done

echo ""
echo -e "  ${BOLD}Templates de rules (para novos projetos):${NC}"
for RULE in memoria.md seguranca-github.md ambiente.md; do
    if [ -f "$SKILL_DIR/templates/rules-projeto/$RULE" ]; then
        echo -e "  ${GREEN}✓${NC} rules-projeto/$RULE"
    else
        echo -e "  ${YELLOW}⚠${NC} rules-projeto/$RULE nao encontrado"
    fi
done

echo ""

if [ $ERROS -eq 0 ]; then
    echo -e "${CYAN}═══════════════════════════════════════════════════${NC}"
    if [ "$MODO" = "atualizacao" ]; then
        echo -e "${GREEN}${BOLD}  ✓ ATUALIZACAO COMPLETA${NC}"
    else
        echo -e "${GREEN}${BOLD}  ✓ INSTALACAO COMPLETA${NC}"
    fi
    echo -e "${CYAN}═══════════════════════════════════════════════════${NC}"
    echo ""
    echo -e "  ${BOLD}Como usar:${NC}"
    echo -e "  Abra o Claude Code e diga:"
    echo -e "  ${CYAN}\"Cria um projeto\"${NC}"
    echo -e "  ${CYAN}\"Novo projeto\"${NC}"
    echo -e "  ${CYAN}\"Quero criar um app\"${NC}"
    echo ""
    echo -e "  ${BOLD}Para atualizar no futuro:${NC}"
    echo -e "  ${CYAN}git pull && ./instalar.sh${NC}"
    echo ""
else
    echo -e "${RED}  ✗ Instalacao com erros. Verifique os itens acima.${NC}"
    echo ""
fi
