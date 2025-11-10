# ============================================================
# 💤 POWERLEVEL10K INSTANT PROMPT (Desactivado)
# ------------------------------------------------------------
# Lo dejamos comentado porque Starship gestiona su propio prompt.
# ============================================================
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# ============================================================
# 🧭 OH MY ZSH - CONFIGURACIÓN BÁSICA
# ============================================================
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=""                      # Sin tema: dejamos que Starship controle el prompt
DISABLE_CORRECTION="true"         # Desactiva corrección automática de comandos
zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 14

# ============================================================
# 📁 DIRECTORIO DE CONFIGURACIÓN MODULAR
# ============================================================
ZSH_CONFIG_DIR="$HOME/.config/zsh"

# ============================================================
# ⚙️ CARGA DE MÓDULOS BÁSICOS
# ============================================================
# Variables de entorno y configuración general
[[ -r "$ZSH_CONFIG_DIR/env.zsh" ]] && source "$ZSH_CONFIG_DIR/env.zsh"

# Historial (orden, tamaño, comportamiento)
[[ -r "$ZSH_CONFIG_DIR/history.zsh" ]] && source "$ZSH_CONFIG_DIR/history.zsh"

# Plugins y Oh My Zsh
[[ -r "$ZSH_CONFIG_DIR/plugins.zsh" ]] && source "$ZSH_CONFIG_DIR/plugins.zsh" || source "$ZSH/oh-my-zsh.sh"

# ============================================================
# 🧾 ALIASES PERSONALIZADOS
# ============================================================
if [[ -r "$ZSH_CONFIG_DIR/aliases.zsh" ]]; then
  # Eliminamos posibles alias previos de OMZ para evitar conflictos
  unalias ls la l ll lt ld laa 2>/dev/null
  source "$ZSH_CONFIG_DIR/aliases.zsh"
fi

# ============================================================
# 🚀 STARSHIP PROMPT (MODULAR)
# ============================================================
# Carga la integración modular si existe
[[ -r "$ZSH_CONFIG_DIR/starship.zsh" ]] && source "$ZSH_CONFIG_DIR/starship.zsh"

# ============================================================
# 🎨 PROMPT PERSONALIZADO (OPCIONAL)
# ============================================================
# Este archivo puede usarse para definir colores o overrides
# adicionales a Starship, pero puede quedarse vacío.
[[ -r "$ZSH_CONFIG_DIR/prompt.zsh" ]] && source "$ZSH_CONFIG_DIR/prompt.zsh"

# ============================================================
# 🔍 DEBUG OPCIONAL
# ============================================================
# Muestra los alias cargados si ZSH_DEBUG_ALIASES=1
if [[ "$ZSH_DEBUG_ALIASES" == "1" ]]; then
  echo "=== ALIASES DEFINIDOS ==="
  alias | grep -E '^ls=|^ll=|^la=' || echo "(ninguno definido)"
  echo "========================="
fi

