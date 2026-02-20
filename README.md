# CRIADOR DE PROJETOS para Claude Code

---

## O que é isso?

Imagine que você quer contratar um assistente para organizar seus projetos de programação. Toda vez que você dissesse "quero criar um projeto de controle financeiro", ele imediatamente criaria uma pasta organizada, separaria os arquivos nos lugares certos, conectaria tudo ao GitHub (o lugar onde programadores guardam os projetos na nuvem) e deixaria tudo pronto para começar a trabalhar.

**É exatamente isso que este sistema faz.**

Depois de instalar, você abre o Claude Code no terminal, diz algo como *"criar um projeto de lista de tarefas"*, e o Claude organiza tudo automaticamente. Você não precisa criar pasta, não precisa configurar nada, não precisa lembrar de fazer backup. Ele faz por você.

> **Este repositório é para quem usa o Claude Code no Terminal** (digitando `claude` numa janela de terminal).
> Se você usa o **VS Code com a extensão Claude Code**, use este outro repositório, que é específico para esse caso:
> https://github.com/Hackerdomarketing/criador-de-projetos-claude-code-no-vscode

---

## Instalação

Abra o **Claude Code** e cole este prompt:

> **"Por favor, instala este sistema pra mim: https://github.com/Hackerdomarketing/criador-de-projetos-no-claude-code — Clona o repositório, entra na pasta e roda o arquivo instalar.sh. Ele vai verificar e instalar tudo que estiver faltando automaticamente."**

Pronto. O Claude vai baixar os arquivos e instalar tudo automaticamente — Node.js, GitHub CLI, autenticação no GitHub. Se precisar de alguma confirmação ou senha durante o processo, ele vai pedir na hora.

**Se você usa Windows:** antes desse passo, instale o **Git for Windows** em https://git-scm.com/download/win — clique em Next em todas as telas. O Git é necessário para baixar os arquivos do repositório. Depois é só abrir o Claude Code e colar o prompt acima normalmente.

---

## Usando depois de instalar

### De onde você deve iniciar o Claude Code

Sempre inicie o Claude Code **de dentro da pasta onde seus projetos ficam** — a mesma pasta que você escolheu na instalação.

Por exemplo, se você escolheu `~/projetos/`:

```
cd ~/projetos
claude
```

O Claude precisa estar na pasta certa para encontrar as instruções que você instalou.

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
| `ARQUITETURA-MENTAL.md` | Define como o Claude vai pensar e se comportar neste projeto. Ele lê isso sempre. |
| `CLAUDE.md` | As instruções do projeto: memória, nomenclatura, como se comunicar com você. |
| `.memoria-ultimas-tarefas.md` | As 3 últimas tarefas feitas. O Claude lê isso primeiro ao abrir o projeto. |
| `.memoria-do-dia.md` | Registro cronológico de tudo que foi feito hoje neste projeto. |
| `.memoria-projeto.md` | Memória completa do projeto: decisões, arquitetura, histórico. |
| `README.md` | Documento explicando o que o projeto faz e como usar. |
| `.gitignore` | Lista de arquivos que não vão para o GitHub (senhas, arquivos temporários). |

---

## Perguntas frequentes

**Por que preciso abrir o terminal na pasta certa?**

O Claude Code lê as instruções de um arquivo chamado `CLAUDE.md` que fica na pasta onde você o abre. Esse arquivo contém todas as regras do sistema de criação de projetos. Se você abrir o Claude em outra pasta, ele não vai encontrar esse arquivo.

**E se eu já tiver um arquivo CLAUDE.md na minha pasta de projetos?**

O instalador não apaga nem modifica o que você já tem. Ele só cria um CLAUDE.md novo se não existir nenhum. Se você já tem um, o instalador vai avisar e não vai mexer nele.

**O repositório que o Claude cria no GitHub é privado ou público?**

Sempre privado. Só você tem acesso. Ninguém mais consegue ver.

**O que é o `~` que aparece nos caminhos de pasta?**

O `~` é uma abreviação para a pasta do seu usuário. Por exemplo, se seu nome de usuário é `joao`, então `~/projetos/` significa `/Users/joao/projetos/` no Mac, ou `C:\Users\joao\projetos\` no Windows.

**Posso desinstalar se não gostar?**

Sim. Basta deletar a pasta `CRIADOR-DE-PROJETOS/` e o arquivo `CLAUDE.md` de dentro da pasta que você escolheu durante a instalação. Nada mais foi modificado no seu computador.

**O que é o Git que o Claude configura em cada projeto?**

O Git é um sistema que registra cada mudança feita nos arquivos do projeto — como um histórico completo. Se você apagar algo por acidente, ou quiser voltar para uma versão anterior, o Git permite isso. Quando o Claude cria um projeto, ele configura o Git automaticamente.
