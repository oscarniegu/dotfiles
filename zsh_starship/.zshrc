# Powerlevel10k instant prompt (desactivado porque usaremos Starship)
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

export ZSH="$HOME/.oh-my-zsh"
# ZSH_THEME="powerlevel10k/powerlevel10k"  # Desactivado para usar Starship
ZSH_THEME=""  # Deja vacío para evitar conflictos con Starship
DISABLE_CORRECTION="true"
zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 14

# Directorio de config modular
ZSH_CONFIG_DIR="$HOME/.config/zsh"

# Carga env e historial primero
[[ -r "$ZSH_CONFIG_DIR/env.zsh" ]] && source "$ZSH_CONFIG_DIR/env.zsh"
[[ -r "$ZSH_CONFIG_DIR/history.zsh" ]] && source "$ZSH_CONFIG_DIR/history.zsh"

# Source Oh My Zsh y plugins (necesita ZSH definido)
[[ -r "$ZSH_CONFIG_DIR/plugins.zsh" ]] && source "$ZSH_CONFIG_DIR/plugins.zsh" || source "$ZSH/oh-my-zsh.sh"

# Ahora carga ALIASES explícitamente y FORZANDO que sobreescriban
if [[ -r "$ZSH_CONFIG_DIR/aliases.zsh" ]]; then
  # eliminar posibles aliases previos que puedan interferir
  unalias ls la l ll lt ld laa 2>/dev/null
  source "$ZSH_CONFIG_DIR/aliases.zsh"
fi

# source <(fzf --zsh)

# Finalmente el prompt personalizado (si existe)
[[ -r "$ZSH_CONFIG_DIR/prompt.zsh" ]] && source "$ZSH_CONFIG_DIR/prompt.zsh"

# === Integración con Starship ===
# Inicializa Starship al final, para que sobreescriba el prompt de OMZ
if command -v starship &>/dev/null; then
  eval "$(starship init zsh)"
else
  echo "⚠️  Starship no está instalado. Instálalo con: curl -sS https://starship.rs/install.sh | sh"
fi

# Para debug temporal: muestra si los alias están cargados al iniciar
if [[ "$ZSH_DEBUG_ALIASES" == "1" ]]; then
  echo "=== ALIASES DEFINIDOS ==="
  alias | grep -E '^ls=|^ll=|^la=' || echo "(ninguno definido)"
  echo "========================="
fi

