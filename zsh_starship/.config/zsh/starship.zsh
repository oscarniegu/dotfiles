# ============================================================
# 🚀 STARSHIP PROMPT - INTEGRACIÓN MODULAR PARA ZSH
# ------------------------------------------------------------
# Este módulo configura e inicializa el prompt de Starship,
# sustituyendo completamente el prompt de Oh My Zsh o p10k.
# 
# Características:
#  - Se ejecuta solo en shells interactivas.
#  - No muestra avisos en scripts o shells no interactivas.
#  - Limpia cualquier PROMPT residual antes de iniciar Starship.
#  - Usa tu configuración personalizada (~/.config/starship.toml).
# ============================================================

# Solo continuar si la shell es interactiva (no en scripts)
[[ $- != *i* ]] && return

# Verifica si Starship está instalado
if command -v starship &>/dev/null; then
  # === Variables de entorno recomendadas ===
  export STARSHIP_CONFIG="$HOME/.config/starship.toml"   # Ruta a tu config personalizada
  export STARSHIP_CACHE="$HOME/.cache/starship"          # Directorio de caché
  export STARSHIP_LOG="error"                            # Solo errores, sin avisos
  export STARSHIP_TERM="truecolor"                       # Colores completos

  # === Limpieza de temas previos ===
  # Desactiva el tema de Oh My Zsh y limpia prompts residuales
  ZSH_THEME=""
  unset PROMPT
  unset RPROMPT

  # === Inicialización de Starship ===
  # Evalúa el inicializador oficial
  eval "$(starship init zsh)"

else
  # Solo muestra mensaje si es una sesión interactiva con TTY
  if [[ -t 1 ]]; then
    echo "⚠️  Starship no está instalado."
    echo "En Arch instalalo con sudo pacmam -S starship"
    echo "O instálalo con: curl -sS https://starship.rs/install.sh | sh"
  fi
fi

# ============================================================
# 💡 NOTAS:
#  - Este archivo debe cargarse DESPUÉS de plugins.zsh
#    y ANTES o en lugar de prompt.zsh.
#  - Si tienes un prompt.zsh existente, puedes dejarlo vacío
#    o usarlo para overrides específicos de Starship.
# ============================================================

