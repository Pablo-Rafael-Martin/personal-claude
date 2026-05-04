#!/usr/bin/env bash
# UserPromptSubmit hook: injeta marker ORQ_MODE quando .claude/state/orq.flag
# existe no diretório de trabalho (project-local). Toggle controlado por /orq e /orq-off.

set -u

if [ -f "$PWD/.claude/state/orq.flag" ]; then
  jq -n '{hookSpecificOutput: {hookEventName: "UserPromptSubmit", additionalContext: "ORQ_MODE: ATIVO. Aplique a seção \"Modo Orquestrador\" do CLAUDE.md neste turno."}}'
fi
