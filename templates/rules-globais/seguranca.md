# Seguranca

## Arquivos que NUNCA devem ir para o GitHub

- `.env` e `.env.*` — contem senhas, chaves de API e dados secretos
- `credentials.json` — credenciais de servicos (Google, Firebase, etc.)
- `*.pem` e `*.key` — chaves de criptografia privadas

## Antes de fazer upload (push) para o GitHub

1. Verificar que `.gitignore` existe na raiz do projeto
2. Verificar que `.env` NAO aparece no `git status` — se aparecer, o `.gitignore` esta errado
3. Nunca usar `git add .` sem antes olhar o `git status` — garantir que so arquivos seguros serao enviados
4. Se criou `.env.example`, conferir que ele tem APENAS os nomes das variaveis, SEM os valores reais

## Se cometer um erro e subir credencial

1. Trocar a credencial imediatamente — considere-a comprometida
2. Remover o arquivo do Git: `git rm --cached nome-do-arquivo`
3. Adicionar ao `.gitignore`
4. Fazer novo commit e push
5. IMPORTANTE: Mesmo apos remover, a credencial continua no historico do Git. Trocar a senha/chave e obrigatorio.
