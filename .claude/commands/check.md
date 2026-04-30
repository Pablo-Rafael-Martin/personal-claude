---
description: Revisa tipagem em fronteira de dados e tratamento de erro no diff atual ou em arquivos específicos.
argument-hint: [arquivos opcionais]
---

Use o agent `boundary-reviewer` para revisar o código.

- Se `$ARGUMENTS` não estiver vazio, passe os paths como escopo direto pro agent.
- Senão, deixe o agent inferir escopo a partir do diff atual contra o branch base (`main`/`master`/`HEAD~1`).

Reporte os achados do agent ao usuário sem alterar código.
