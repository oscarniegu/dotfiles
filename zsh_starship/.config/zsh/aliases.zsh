# ────────────────────────────────────────────────────────────────
# 🔧 Aliases con eza
# ────────────────────────────────────────────────────────────────
alias ls='eza --icons --group-directories-first'
alias la='ls -a'
alias l='ls -l'
alias ll='ls -la'
alias ld='ls -lD'
alias lt='ls --tree --level=2'
alias laa='ls -lahgHimUS --time-style=long-iso --git --color-scale'

alias memoria="watch -n 5 'free -h; echo \"\"; zramctl --output-all; echo \"\"; swapon --show'"
alias parudel='paru -Qq | fzf -m --prompt="🧹 Elige paquetes a eliminar: " --preview "paru -Qi {}" | xargs -r sudo paru -Rns'

