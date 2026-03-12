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

echo -e "${YELLOW}[1/2]${NC} Copiando arquivos..."

mkdir -p "$SKILL_DIR"
mkdir -p "$SKILL_DIR/templates"

# Copiar arquivos principais
cp "$SCRIPT_DIR/SKILL.md" "$SKILL_DIR/SKILL.md"
cp "$SCRIPT_DIR/AGENTE.md" "$SKILL_DIR/AGENTE.md"
cp "$SCRIPT_DIR/ARQUITETURA-MENTAL.md" "$SKILL_DIR/ARQUITETURA-MENTAL.md"
cp "$SCRIPT_DIR/REGRA-ATIVACAO.md" "$SKILL_DIR/REGRA-ATIVACAO.md"

# Copiar templates
if [ -d "$SCRIPT_DIR/templates" ]; then
    cp "$SCRIPT_DIR/templates/"* "$SKILL_DIR/templates/" 2>/dev/null || true
fi

echo -e "  ${GREEN}✓${NC} Arquivos copiados para $SKILL_DIR"
echo ""

# ─── PASSO 2: Verificar instalacao ──────────────────────────

echo -e "${YELLOW}[2/2]${NC} Verificando..."

ERROS=0

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
