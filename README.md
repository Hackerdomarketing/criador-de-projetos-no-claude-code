# CRIADOR DE PROJETOS para Claude Code

---

## O que é isso?

Imagine que você quer contratar um assistente para organizar seus projetos de programação. Toda vez que você dissesse *"quero criar um projeto de controle financeiro"*, ele imediatamente criaria uma pasta organizada, separaria os arquivos nos lugares certos, conectaria tudo ao GitHub (o lugar onde programadores guardam os projetos na nuvem) e deixaria tudo pronto para começar a trabalhar.

**É exatamente isso que este sistema faz.**

Depois de instalar, você abre o Claude Code e diz algo como *"criar um projeto de lista de tarefas"*, e o Claude organiza tudo automaticamente. Você não precisa criar pasta, não precisa configurar nada, não precisa lembrar de fazer backup. Ele faz por você.

> Este repositório é para quem usa o **Claude Code no terminal** (digitando `claude`) ou no **Claude Desktop App**.
> Se você usa o Claude Code como extensão do VS Code, use este outro:
> https://github.com/Hackerdomarketing/criador-de-projetos-claude-code-no-vscode

---

## Instalação

A instalação é feita pelo próprio Claude Code. Você só precisa colar um prompt — ele faz todo o resto.

---

### Se você usa Mac

**No terminal:** abra o Terminal (Command + Espaço → Terminal → Enter), digite `claude` e pressione Enter. Quando o Claude abrir, cole o prompt abaixo.

**No Claude Desktop App:** abra o app e cole o prompt diretamente na conversa.

```
Por favor, instala o sistema Criador de Projetos no meu computador.

Passos:
1. Clona este repositório em ~/Downloads:
   https://github.com/Hackerdomarketing/criador-de-projetos-no-claude-code.git
2. Entra na pasta clonada
3. Roda: bash instalar.sh
   O script vai perguntar onde guardar os projetos (padrão: ~/projetos).
   Ele verifica e instala automaticamente Node.js, GitHub CLI
   e faz a autenticação no GitHub. Confirme as permissões que ele pedir.
4. Ao terminar, me mostra o que foi instalado e como começar a usar.
```

O Claude vai pedir permissão antes de cada ação. Clique em **Sim** para tudo — ele está instalando as ferramentas necessárias. Se pedir a senha do seu computador, é normal — é para instalar programas.

---

### Se você usa Windows

No Windows, você precisa de um programa chamado **Git for Windows** antes de instalar. Ele é necessário para o Claude conseguir baixar os arquivos do repositório.

**Para instalar o Git for Windows:**
1. Acesse: https://git-scm.com/download/win
2. O download começa automaticamente — abra o arquivo que baixar
3. Clique **Next** em todas as telas (as opções padrão estão corretas) e **Install**

Depois de instalar o Git, abra o Claude Code (no terminal Git Bash digitando `claude`, ou no Claude Desktop App) e cole o prompt abaixo:

```
Por favor, instala o sistema Criador de Projetos no meu computador.
Estou no Windows com Git Bash disponível.

Passos:
1. Clona este repositório em ~/Downloads:
   https://github.com/Hackerdomarketing/criador-de-projetos-no-claude-code.git
2. Entra na pasta clonada
3. Roda: bash instalar.sh
   O script vai perguntar onde guardar os projetos (padrão: ~/projetos,
   que no Windows equivale a C:\Users\seu-nome\projetos).
   Ele verifica se Node.js e GitHub CLI estão instalados.
   Se não estiverem, vai mostrar como instalar cada um.
4. Ao terminar, me mostra o que foi instalado e como começar a usar.
```

---

## Usando depois de instalar

### De onde você deve iniciar o Claude Code

Sempre inicie o Claude Code **de dentro da pasta onde seus projetos ficam** — a mesma pasta que você escolheu na instalação.

**No terminal (Mac ou Windows Git Bash):**
```
cd ~/projetos
claude
```

**No Claude Desktop App:** o sistema funciona a partir do momento em que o Claude tem acesso à pasta de projetos via MCP. Certifique-se de que a pasta de projetos está acessível no seu Desktop App.

### O que dizer para criar um projeto

Simplesmente descreva o que você quer criar:

*"Criar um projeto de lista de tarefas em Python"*

*"Novo projeto: um site de portfólio com Next.js"*

*"Quero criar um sistema de controle de estoque"*

*"Faz um app de calculadora de gastos"*

O Claude vai perguntar algumas coisas para entender melhor — tecnologia, funcionalidades, integrações. Responda normalmente, como se fosse uma conversa. Depois, ele cria tudo automaticamente: pasta, arquivos, código inicial, repositório no GitHub.

---

## O que é criado em cada projeto

Toda vez que você pede um projeto novo, o Claude cria estes arquivos dentro de uma pasta com o nome do projeto:

| Arquivo | Para que serve |
|---------|----------------|
| `CLAUDE.md` | As instruções do projeto: memória, nomenclatura, como se comunicar com você. |
| `.memoria-ultimas-tarefas.md` | As 3 últimas tarefas feitas. O Claude lê isso primeiro ao abrir o projeto. |
| `.memoria-do-dia.md` | Registro cronológico de tudo que foi feito hoje neste projeto. |
| `.memoria-projeto.md` | Memória completa do projeto: decisões, arquitetura, histórico. |
| `README.md` | Documento explicando o que o projeto faz e como usar. |
| `.gitignore` | Lista de arquivos que não vão para o GitHub (senhas, arquivos temporários). |

---

## Perguntas frequentes

**Por que preciso iniciar o Claude Code na pasta certa?**

O Claude Code lê as instruções de um arquivo chamado `CLAUDE.md` que fica na pasta onde você o abre. Esse arquivo contém todas as regras do sistema. Se você abrir o Claude em outra pasta, ele não vai encontrar esse arquivo e não vai saber criar projetos automaticamente.

**E se eu já tiver um arquivo CLAUDE.md na minha pasta de projetos?**

O instalador não apaga nem modifica o que você já tem. Ele só cria um CLAUDE.md novo se não existir nenhum. Se você já tem um, ele vai avisar e não vai mexer. Para adicionar as instruções deste sistema ao seu CLAUDE.md existente, copie o conteúdo de `CRIADOR-DE-PROJETOS/templates/CLAUDE.md` e cole no seu.

**O repositório que o Claude cria no GitHub é privado ou público?**

Sempre privado. Só você tem acesso.

**O que é o `~` que aparece nos caminhos de pasta?**

É uma abreviação para a pasta do seu usuário. Se seu nome de usuário é `joao`, então `~/projetos/` significa `/Users/joao/projetos/` no Mac, ou `C:\Users\joao\projetos\` no Windows.

**Posso desinstalar se não gostar?**

Sim. Delete a pasta `CRIADOR-DE-PROJETOS/` e o arquivo `CLAUDE.md` de dentro da pasta que você escolheu durante a instalação. Nada mais foi modificado no seu computador.

**O que é o Git que o Claude configura em cada projeto?**

O Git é um sistema que registra cada mudança feita nos arquivos do projeto — como um histórico completo. Se você apagar algo por acidente ou quiser voltar para uma versão anterior, o Git permite isso. Quando o Claude cria um projeto, ele configura o Git automaticamente para você não precisar fazer isso na mão.
