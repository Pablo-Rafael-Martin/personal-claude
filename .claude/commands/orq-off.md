---
description: Desliga modo orquestrador NESTE projeto. Volta ao default (Claude trabalha direto).
---

ESTA EXECUÇÃO É EXCEÇÃO ao modo orquestrador (mesmo se a flag estiver ativa, este turno responde direto).

Execute (path relativo ao cwd):
1. `rm -f .claude/state/orq.flag`
2. Confirme ao usuário: "Modo orquestrador DESLIGADO neste projeto. Comportamento volta ao default."
