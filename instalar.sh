#!/bin/bash
# ============================================
# CRIADOR DE PROJETOS — Instalação
# Versão: qualquer interface com Claude Code
# ============================================

echo ""
echo "═══════════════════════════════════════════════════"
echo "  Criador de Projetos — Instalação"
echo "═══════════════════════════════════════════════════"
echo ""
echo "  Vamos verificar se o seu computador tem tudo"
echo "  que precisa antes de instalar."
echo ""

HOUVE_ERRO=0

# ─────────────────────────────────────────────────────
# VERIFICAÇÃO 1 — Homebrew
# O Homebrew é um instalador de programas para Mac.
# Precisamos dele para instalar o Node.js e o GitHub CLI.
# ─────────────────────────────────────────────────────

echo "  Verificando Homebrew (instalador de programas para Mac)..."

if ! command -v brew &>/dev/null; then
    echo ""
    echo "  O Homebrew não está instalado."
    echo "  Ele é necessário para instalar o Node.js e o GitHub CLI."
    echo "  Instalando agora..."
    echo ""
    echo "  Pode aparecer uma janela pedindo a senha do seu computador."
    echo "  Isso é normal — é para ter permissão de instalar programas."
    echo ""
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # No Apple Silicon (M1/M2/M3), o Homebrew fica em /opt/homebrew
    if [ -f "/opt/homebrew/bin/brew" ]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi

    if ! command -v brew &>/dev/null; then
        echo ""
        echo "  ✗ Não foi possível instalar o Homebrew automaticamente."
        echo "    Acesse https://brew.sh e siga as instruções de instalação manual."
        echo "    Depois de instalar, rode este script novamente."
        exit 1
    fi

    echo ""
    echo "  ✓ Homebrew instalado com sucesso."
else
    echo "  ✓ Homebrew já está instalado."
fi

echo ""

# ─────────────────────────────────────────────────────
# VERIFICAÇÃO 2 — Node.js
# O Claude Code precisa do Node.js para funcionar.
# ─────────────────────────────────────────────────────

echo "  Verificando Node.js (necessário para o Claude Code funcionar)..."

if ! command -v node &>/dev/null; then
    echo ""
    echo "  O Node.js não está instalado. Instalando agora..."
    brew install node

    if ! command -v node &>/dev/null; then
        echo ""
        echo "  ✗ Não foi possível instalar o Node.js automaticamente."
        echo "    Baixe em: https://nodejs.org (clique no botão LTS)"
        echo "    Instale normalmente e rode este script novamente."
        HOUVE_ERRO=1
    else
        echo "  ✓ Node.js instalado: $(node --version)"
    fi
else
    echo "  ✓ Node.js já está instalado: $(node --version)"
fi

echo ""

# ─────────────────────────────────────────────────────
# VERIFICAÇÃO 3 — GitHub CLI
# Ferramenta que cria repositórios no GitHub automaticamente.
# ─────────────────────────────────────────────────────

echo "  Verificando GitHub CLI (cria repositórios no GitHub automaticamente)..."

if ! command -v gh &>/dev/null; then
    echo ""
    echo "  O GitHub CLI não está instalado. Instalando agora..."
    brew install gh

    if ! command -v gh &>/dev/null; then
        echo ""
        echo "  ✗ Não foi possível instalar o GitHub CLI automaticamente."
        echo "    Tente manualmente: brew install gh"
        HOUVE_ERRO=1
    else
        echo "  ✓ GitHub CLI instalado: $(gh --version | head -1)"
    fi
else
    echo "  ✓ GitHub CLI já está instalado: $(gh --version | head -1)"
fi

echo ""

# ─────────────────────────────────────────────────────
# VERIFICAÇÃO 4 — Autenticação no GitHub
# Garante que o GitHub CLI está conectado à sua conta.
# ─────────────────────────────────────────────────────

if command -v gh &>/dev/null; then
    echo "  Verificando se o GitHub CLI está conectado à sua conta..."

    if ! gh auth status &>/dev/null; then
        echo ""
        echo "  O GitHub CLI não está conectado ao GitHub."
        echo "  Vamos conectar agora. Siga as instruções abaixo:"
        echo ""
        echo "  ➜ Use as setas do teclado para navegar pelo menu"
        echo "  ➜ Escolha: GitHub.com"
        echo "  ➜ Escolha: HTTPS"
        echo "  ➜ Escolha: Login with a web browser"
        echo "  ➜ Um código vai aparecer — copie-o"
        echo "  ➜ O navegador vai abrir — cole o código lá"
        echo "  ➜ Faça login na sua conta do GitHub"
        echo ""
        echo "  Pressione Enter quando estiver pronto para começar..."
        read -r

        gh auth login

        if ! gh auth status &>/dev/null; then
            echo ""
            echo "  ✗ Não foi possível conectar ao GitHub."
            echo "    Tente novamente com: gh auth login"
            HOUVE_ERRO=1
        else
            echo ""
            echo "  ✓ Conectado ao GitHub com sucesso!"
        fi
    else
        USUARIO_GH=$(gh api user --jq '.login' 2>/dev/null || echo "desconhecido")
        echo "  ✓ GitHub CLI conectado como: @$USUARIO_GH"
    fi
fi

echo ""

# ─────────────────────────────────────────────────────
# Se houve algum erro nas verificações, parar aqui
# ─────────────────────────────────────────────────────

if [ "$HOUVE_ERRO" = "1" ]; then
    echo "  ════════════════════════════════════════════════"
    echo "  ⚠️  Alguns itens não puderam ser instalados."
    echo "     Resolva os problemas acima e rode o"
    echo "     instalador novamente."
    echo "  ════════════════════════════════════════════════"
    echo ""
    exit 1
fi

# ─────────────────────────────────────────────────────
# ESCOLHA DA PASTA
# ─────────────────────────────────────────────────────

echo "  ════════════════════════════════════════════════"
echo "  Tudo verificado! Instalando o sistema..."
echo "  ════════════════════════════════════════════════"
echo ""
echo "  Onde você quer guardar seus projetos?"
echo "  (Pressione Enter para usar o padrão: ~/projetos)"
echo ""
read -p "  Pasta base [~/projetos]: " PASTA_ESCOLHIDA
echo ""

if [ -z "$PASTA_ESCOLHIDA" ]; then
    PASTA_BASE="$HOME/projetos"
else
    PASTA_BASE="${PASTA_ESCOLHIDA/#\~/$HOME}"
fi

echo "  ✓ Pasta escolhida: $PASTA_BASE"
echo ""

# ─────────────────────────────────────────────────────
# INSTALAÇÃO — Copiar arquivos do sistema
# ─────────────────────────────────────────────────────

if [ ! -d "$PASTA_BASE" ]; then
    echo "  Criando pasta $PASTA_BASE..."
    mkdir -p "$PASTA_BASE"
fi

if [ -d "$PASTA_BASE/CRIADOR-DE-PROJETOS" ]; then
    echo "  ⚠️  Já existe uma instalação — ela será atualizada."
    echo ""
fi

mkdir -p "$PASTA_BASE/CRIADOR-DE-PROJETOS/templates"
cp ARQUITETURA-MENTAL.md "$PASTA_BASE/CRIADOR-DE-PROJETOS/"
cp AGENTE.md             "$PASTA_BASE/CRIADOR-DE-PROJETOS/"
cp REGRA-ATIVACAO.md     "$PASTA_BASE/CRIADOR-DE-PROJETOS/"
cp README.md             "$PASTA_BASE/CRIADOR-DE-PROJETOS/"
cp templates/CLAUDE.md                    "$PASTA_BASE/CRIADOR-DE-PROJETOS/templates/"
cp templates/.memoria-ultimas-tarefas.md  "$PASTA_BASE/CRIADOR-DE-PROJETOS/templates/"
cp templates/.memoria-do-dia.md           "$PASTA_BASE/CRIADOR-DE-PROJETOS/templates/"

sed -i '' "s|~/projetos/|$PASTA_BASE/|g" "$PASTA_BASE/CRIADOR-DE-PROJETOS/AGENTE.md"         2>/dev/null || true
sed -i '' "s|~/projetos/|$PASTA_BASE/|g" "$PASTA_BASE/CRIADOR-DE-PROJETOS/REGRA-ATIVACAO.md" 2>/dev/null || true

echo "  ✓ Sistema instalado em $PASTA_BASE/CRIADOR-DE-PROJETOS/"
echo ""

if [ ! -f "$PASTA_BASE/CLAUDE.md" ]; then
    cp templates/CLAUDE.md "$PASTA_BASE/CLAUDE.md"
    DATE=$(date +%Y-%m-%d)
    sed -i '' "s/\[DATA-ATUAL\]/$DATE/g" "$PASTA_BASE/CLAUDE.md"
    echo "  ✓ CLAUDE.md criado em $PASTA_BASE/CLAUDE.md"
else
    echo "  ✓ CLAUDE.md já existe — não foi alterado."
    echo "    Para adicionar as regras deste sistema ao seu CLAUDE.md,"
    echo "    copie o conteúdo de: $PASTA_BASE/CRIADOR-DE-PROJETOS/templates/CLAUDE.md"
fi

echo ""

# ─────────────────────────────────────────────────────
# GIT E GITHUB — Versionar o CRIADOR-DE-PROJETOS
# Cria um repositório privado no GitHub do usuário
# com o próprio sistema instalado — como backup.
# ─────────────────────────────────────────────────────

PASTA_CRIADOR="$PASTA_BASE/CRIADOR-DE-PROJETOS"

echo "  Criando repositório do sistema no seu GitHub..."
echo ""

cd "$PASTA_CRIADOR" || exit 1

# Criar .gitignore para o CRIADOR-DE-PROJETOS
cat > .gitignore << 'GITIGNORE'
.DS_Store
*.log
/.memoria-*.md
!templates/.memoria-*.md
GITIGNORE

# Inicializar git se ainda não for um repositório
if [ ! -d ".git" ]; then
    git init -b main 2>/dev/null || git init && git checkout -b main 2>/dev/null || true
fi

# Verificar se o remote já existe (atualização)
if git remote get-url origin &>/dev/null; then
    echo "  ↻ Repositório já existe — enviando atualização..."
    git add -A
    git commit -m "chore: atualização do sistema criador de projetos" 2>/dev/null || true
    git push origin main
    LINK_REPO=$(gh repo view --json url -q '.url' 2>/dev/null || echo "")
    echo "  ✓ Repositório atualizado: $LINK_REPO"
else
    # Verificar se o repositório já existe no GitHub
    USUARIO_GH=$(gh api user --jq '.login' 2>/dev/null || echo "")
    REPO_JA_EXISTE=$(gh repo view "$USUARIO_GH/criador-de-projetos" --json name -q '.name' 2>/dev/null || echo "")

    git add -A
    git commit -m "feat: instalação do sistema criador de projetos"

    if [ -n "$REPO_JA_EXISTE" ]; then
        # Repositório existe mas sem remote configurado
        git remote add origin "https://github.com/$USUARIO_GH/criador-de-projetos.git"
        git push -u origin main
        LINK_REPO="https://github.com/$USUARIO_GH/criador-de-projetos"
    else
        # Criar novo repositório privado
        gh repo create criador-de-projetos \
            --private \
            --source=. \
            --push \
            --description "Meu sistema de criação de projetos com Claude Code" \
            2>/dev/null || true
        LINK_REPO=$(gh repo view "$USUARIO_GH/criador-de-projetos" --json url -q '.url' 2>/dev/null || echo "")
    fi

    if [ -n "$LINK_REPO" ]; then
        echo "  ✓ Repositório criado (privado): $LINK_REPO"
    else
        echo "  ⚠️  Não foi possível criar o repositório no GitHub."
        echo "    Os arquivos estão instalados localmente normalmente."
    fi
fi

echo ""
echo "═══════════════════════════════════════════════════"
echo "  Instalação concluída!"
echo ""
echo "  O que foi instalado:"
echo "  ✓ Node.js (necessário para o Claude Code)"
echo "  ✓ GitHub CLI (cria repositórios automaticamente)"
echo "  ✓ Sistema Criador de Projetos em $PASTA_BASE/"
if [ -n "$LINK_REPO" ]; then
echo "  ✓ Backup do sistema no GitHub: $LINK_REPO"
fi
echo ""
echo "  Próximo passo:"
echo "  Abra o terminal em $PASTA_BASE/"
echo "  Digite 'claude' e diga:"
echo "  'criar um projeto' ou 'quero criar'"
echo "═══════════════════════════════════════════════════"
echo ""
