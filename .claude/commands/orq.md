---
description: Liga modo orquestrador NESTE projeto (toggle persistente). Toda tarefa passa a ser delegada a subagents general-purpose. Desliga com /orq-off.
---

ESTA EXECUÇÃO É EXCEÇÃO ao modo orquestrador (mesmo se a flag já existir, este turno responde direto, sem despachar subagent).

Execute (paths relativos ao cwd, isto é, ao diretório do projeto):
1. `mkdir -p .claude/state`
2. `touch .claude/state/orq.flag`
3. Confirme ao usuário: "Modo orquestrador LIGADO neste projeto. A partir do próximo turno, toda tarefa é delegada a subagents general-purpose com briefing estruturado, output numerado e tagueado por macro-tarefa. Desliga com /orq-off."
