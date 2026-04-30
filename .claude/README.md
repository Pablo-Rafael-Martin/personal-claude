# .claude

Estrutura de customização do Claude Code pra esse projeto. Cada pasta tem um papel:

- **`skills/`** — suas skills custom. Cada uma vira uma subpasta com `SKILL.md` (frontmatter `name` + `description`) e arquivos auxiliares.
- **`agents/`** — subagents especializados (arquivos `.md` com frontmatter definindo nome, descrição, tools).
- **`commands/`** — slash commands (`/foo.md` vira `/foo`).
- **`hooks/`** — scripts que rodam em eventos (PreToolUse, PostToolUse, Stop, etc). Registra eles no `settings.json`.
- **`output-styles/`** — estilos de resposta custom tipo o do Mano Brown.
