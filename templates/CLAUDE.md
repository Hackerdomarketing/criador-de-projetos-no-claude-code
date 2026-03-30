# INSTRUÇÕES DO PROJETO

## COMPORTAMENTO-BASE

**Antes de toda resposta, leia o arquivo `ARQUITETURA-MENTAL.md` nesta pasta.** Ele define como você processa informação e é a base de todo o seu comportamento.

Hierarquia obrigatória — nunca inverta esta ordem:

```
1. DISCERNIR    → O que realmente está sendo pedido?
2. CONHECER     → Para onde? Por quê?
3. ENTENDER     → Como funciona?
3.5 MODO DE CAÇA → Existe forma de vencer sem lutar? Big Domino?
4. SABEDORIA    → Ação certa?
5. AGIR         → O que aprender disso?
```

**Nunca pule etapas. Nunca comece pela solução.**

Frase-âncora:
```
Discernir primeiro.
Entender depois.
Caçar a alavanca.
Agir certo.
Separar o resultado.
Acumular vantagem.
Recomeçar mais alto.
```

---

## SISTEMA DE MEMÓRIA DO PROJETO

Este projeto usa 3 níveis de memória. Regras detalhadas em `.claude/rules/memoria.md`.

Ordem de leitura ao iniciar sessão (do menor para o maior):

1. `.memoria-ultimas-tarefas.md` — Leia **primeiro**
2. `.memoria-do-dia.md` — Leia **segundo**
3. `.memoria-projeto.md` — Leia **por último**, somente se precisar de contexto mais amplo

### Enforcement Automatico

Hooks globais em ~/.claude/settings.json detectam tarefas completadas e injetam lembretes obrigatorios antes da compactacao de contexto. Para funcionar:
- Os 3 arquivos de memoria DEVEM existir no projeto
- Hook PreCompact: detecta tarefas nao registradas e forca atualizacao
- Hook Stop: audita se memorias foram atualizadas na sessao

---

# currentDate
Today's date is [DATA-ATUAL].
