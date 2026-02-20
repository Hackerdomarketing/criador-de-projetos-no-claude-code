#!/bin/bash
# ============================================
# CRIADOR DE PROJETOS — Instalação
# Versão: qualquer interface com Claude Code
# ============================================

echo ""
echo "═══════════════════════════════════════"
echo "  Instalando o Criador de Projetos..."
echo "═══════════════════════════════════════"
echo ""
echo "  Onde você quer guardar seus projetos?"
echo "  (Pressione Enter para usar o padrão)"
echo ""
read -p "  Pasta base [~/projetos]: " PASTA_ESCOLHIDA
echo ""

if [ -z "$PASTA_ESCOLHIDA" ]; then
    PASTA_BASE="$HOME/projetos"
else
    # Expandir ~ se o usuário digitar
    PASTA_BASE="${PASTA_ESCOLHIDA/#\~/$HOME}"
fi

echo "  ✓ Pasta escolhida: $PASTA_BASE"
echo ""

# Criar a pasta base se não existir
if [ ! -d "$PASTA_BASE" ]; then
    echo "  Criando pasta $PASTA_BASE..."
    mkdir -p "$PASTA_BASE"
fi

# Verificar se já existe uma instalação anterior
if [ -d "$PASTA_BASE/CRIADOR-DE-PROJETOS" ]; then
    echo "  ⚠️  Já existe uma instalação em $PASTA_BASE/CRIADOR-DE-PROJETOS"
    echo "     Ela será atualizada com a versão atual."
    echo ""
fi

# Copiar arquivos
echo "  Copiando arquivos..."
mkdir -p "$PASTA_BASE/CRIADOR-DE-PROJETOS/templates"
cp ARQUITETURA-MENTAL.md "$PASTA_BASE/CRIADOR-DE-PROJETOS/"
cp AGENTE.md "$PASTA_BASE/CRIADOR-DE-PROJETOS/"
cp REGRA-ATIVACAO.md "$PASTA_BASE/CRIADOR-DE-PROJETOS/"
cp README.md "$PASTA_BASE/CRIADOR-DE-PROJETOS/"
cp templates/CLAUDE.md "$PASTA_BASE/CRIADOR-DE-PROJETOS/templates/"
cp templates/.memoria-ultimas-tarefas.md "$PASTA_BASE/CRIADOR-DE-PROJETOS/templates/"
cp templates/.memoria-do-dia.md "$PASTA_BASE/CRIADOR-DE-PROJETOS/templates/"

# Substituir ~/projetos/ pelo caminho real do usuário nos arquivos copiados
sed -i '' "s|~/projetos/|$PASTA_BASE/|g" "$PASTA_BASE/CRIADOR-DE-PROJETOS/AGENTE.md" 2>/dev/null || true
sed -i '' "s|~/projetos/|$PASTA_BASE/|g" "$PASTA_BASE/CRIADOR-DE-PROJETOS/REGRA-ATIVACAO.md" 2>/dev/null || true

echo "  ✓ CRIADOR-DE-PROJETOS instalado em $PASTA_BASE/"
echo ""

# Verificar se já existe um CLAUDE.md
if [ ! -f "$PASTA_BASE/CLAUDE.md" ]; then
    echo "  Criando CLAUDE.md em $PASTA_BASE/CLAUDE.md..."
    cp templates/CLAUDE.md "$PASTA_BASE/CLAUDE.md"
    DATE=$(date +%Y-%m-%d)
    sed -i '' "s/\[DATA-ATUAL\]/$DATE/g" "$PASTA_BASE/CLAUDE.md"
    echo "  ✓ CLAUDE.md criado com as regras de memória, nomenclatura e comunicação"
else
    echo "  ✓ CLAUDE.md já existe — não foi alterado."
    echo "    Para adicionar as regras deste sistema ao seu CLAUDE.md existente,"
    echo "    copie o conteúdo de: $PASTA_BASE/CRIADOR-DE-PROJETOS/templates/CLAUDE.md"
fi

echo ""
echo "═══════════════════════════════════════"
echo "  Instalação concluída!"
echo ""
echo "  O que foi instalado:"
echo "  ✓ CRIADOR-DE-PROJETOS em $PASTA_BASE/"
echo "  ✓ ARQUITETURA-MENTAL.md (base mental do agente)"
echo "  ✓ Templates de memória e CLAUDE.md"
echo ""
echo "  Próximo passo:"
echo "  Abra o Claude Code e diga:"
echo "  'criar um projeto' ou 'quero criar'"
echo "═══════════════════════════════════════"
echo ""
