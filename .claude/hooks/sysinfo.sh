#!/usr/bin/env bash
# SessionStart hook: coleta info enxuta do sistema e injeta no contexto do Claude.
# Output esperado: JSON {hookSpecificOutput: {hookEventName, additionalContext}}.

set -u

# 1. OS + distro + versão
case "$(uname -s)" in
  Linux)
    if [ -r /etc/os-release ]; then
      # shellcheck disable=SC1091
      . /etc/os-release
      os="${PRETTY_NAME:-${NAME:-Linux}}"
    else
      os="Linux"
    fi
    ;;
  Darwin)
    ver="$(sw_vers -productVersion 2>/dev/null || echo "")"
    name="$(sw_vers -productName 2>/dev/null || echo macOS)"
    os="$name${ver:+ $ver}"
    ;;
  *) os="$(uname -s)" ;;
esac

# 2. Arquitetura + 3. Kernel
arch="$(uname -m)"
kernel="$(uname -r)"

# 4. Shell + versão
shell_name="${SHELL##*/}"
shell_ver=""
case "$shell_name" in
  bash) shell_ver="$(bash --version 2>/dev/null | head -1 | grep -oE '[0-9]+\.[0-9]+(\.[0-9]+)?' | head -1)" ;;
  zsh)  shell_ver="$(zsh --version 2>/dev/null | grep -oE '[0-9]+\.[0-9]+(\.[0-9]+)?' | head -1)" ;;
  fish) shell_ver="$(fish --version 2>/dev/null | grep -oE '[0-9]+\.[0-9]+(\.[0-9]+)?' | head -1)" ;;
esac
shell="$shell_name${shell_ver:+ $shell_ver}"

# 5. Display server + 6. Desktop environment (Linux only)
session_type="${XDG_SESSION_TYPE:-n/a}"
desktop="${XDG_CURRENT_DESKTOP:-n/a}"

# 7. Container engines disponíveis
containers=""
for c in docker podman nerdctl; do
  if command -v "$c" >/dev/null 2>&1; then
    containers="${containers}${containers:+, }$c"
  fi
done
containers="${containers:-nenhum}"

ctx="System: ${os} (${arch}, kernel ${kernel})
Shell: ${shell}
Session: ${session_type} / ${desktop}
Containers: ${containers}"

# Emite JSON pro Claude Code injetar como contexto adicional.
jq -n --arg ctx "$ctx" '{hookSpecificOutput: {hookEventName: "SessionStart", additionalContext: $ctx}}'
