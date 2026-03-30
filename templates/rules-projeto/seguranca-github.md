# Seguranca — Upload para GitHub

O `.gitignore` deste projeto ja bloqueia arquivos sensiveis automaticamente. Mas sempre verifique:

## Arquivos que NUNCA devem ir para o GitHub

- `.env` e `.env.*` — contem senhas, chaves de API e dados secretos
- `credentials.json` — credenciais de servicos
- `*.pem` e `*.key` — chaves de criptografia privadas
- `.memoria-*.md` — memoria local do projeto (dados da sessao)
- `.claude/` — configuracao local do Claude Code

## Checklist antes de push

1. Verificar que `.gitignore` existe na raiz do projeto
2. Verificar que `.env` NAO aparece no `git status`
3. Nunca usar `git add .` sem antes olhar o `git status`
4. Se criou `.env.example`, conferir que tem APENAS os nomes das variaveis, SEM os valores reais
