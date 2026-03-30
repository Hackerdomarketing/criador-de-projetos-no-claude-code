# Comandos Destrutivos

NUNCA executar rm -rf, delete ou qualquer comando destrutivo sem confirmacao explicita do usuario.

## Antes de qualquer comando destrutivo

1. SEMPRE listar primeiro o que sera apagado com `ls`
2. Mostrar ao usuario o que sera removido
3. Pedir confirmacao explicita: "Isso vai apagar [lista]. Posso continuar?"
4. NUNCA executar sem confirmacao — sem excecao

## Validar variaveis antes de usar em caminhos de rm

Sempre verificar que a variavel nao esta vazia:
`[ -z "$VAR" ] && echo "ERRO: variavel vazia, abortando" && exit 1`

## Pastas proibidas sem confirmacao EXPLICITA

~/Applications, ~/Documents, ~/Desktop, ~/Downloads, ~/ (home), /Applications, qualquer pasta com arquivos do usuario.
