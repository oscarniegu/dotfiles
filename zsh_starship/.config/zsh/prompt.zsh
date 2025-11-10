# ============================================================
# 🎨 prompt.zsh — Complemento visual para Starship
# ------------------------------------------------------------
# Este archivo NO reemplaza el prompt de Starship, solo añade
# elementos estéticos y hooks ligeros que no interfieren.
# ============================================================

# 🕐 Mensaje de bienvenida (solo en shells interactivas)
if [[ $- == *i* ]]; then
  echo ""
  print -P "%F{cyan}Bienvenido, $USER 👋%f"
  print -P "%F{yellow}$(date '+%A, %d de %B de %Y — %H:%M:%S')%f"
  echo ""
fi

# ============================================================
# ✨ COLORES DEL CURSOR Y ESTILO VISUAL
# ============================================================
# Cambia el color del cursor según el modo (solo en terminales compatibles)
if [[ -n $TMUX ]]; then
  # Evita conflictos dentro de tmux
  return 0
fi

# Color base del cursor
if [[ "$TERM" == *xterm* || "$TERM" == *kitty* || "$TERM" == *wezterm* ]]; then
  # Verde suave por defecto
  echo -ne "\033]12;#6af76f\007"
fi

# ============================================================
# 🧹 LIMPIEZA Y FORMATO
# ============================================================
# Añade una línea vacía antes de cada nuevo prompt
add_newline_before_prompt() {
  echo ""
}
autoload -Uz add-zsh-hook
add-zsh-hook precmd add_newline_before_prompt

# ============================================================
# ⚙️ OPCIONAL: ESTADO DE COMANDOS
# ============================================================
# Muestra un pequeño aviso si el último comando falló
function notify_error {
  local exit_code=$?
  if [[ $exit_code -ne 0 ]]; then
    print -P "%F{red}✖ Error código $exit_code%f"
  fi
}
add-zsh-hook precmd notify_error

# ============================================================
# 🌈 ALGO DE ESTILO EXTRA (opcional)
# ============================================================
# Cambia el título de la ventana según el directorio actual
case $TERM in
  xterm*|rxvt*|wezterm*)
    function set_terminal_title() {
      print -Pn "\e]0;%n@%m: %~\a"
    }
    add-zsh-hook precmd set_terminal_title
    ;;
esac

