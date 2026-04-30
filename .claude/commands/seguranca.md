---
description: Revisa segurança de uma feature implementada (TS/Py web): auth, authz, input, secrets, injection, AWS.
argument-hint: [descrição da feature ou arquivos]
---

Use o agent `feature-security-reviewer`.

- Se `$ARGUMENTS` parecerem paths de arquivo/pasta, passe como escopo direto pro agent.
- Se for descrição em linguagem natural, passe como contexto e deixe o agent mapear arquivos.
- Se vazio, deixe o agent rodar o diff atual contra o branch base.

Reporte os achados do agent ao usuário sem alterar código.
