  cat ~/.cache/wal/sequences
  oh-my-posh init fish --config ~/.config/ohmyposh/zen.json | source
if status is-interactive
  alias r yazi
  alias v nvim
  alias vg "nvim --listen 127.0.0.1:55432"
  alias ls "eza -a --icons"
  alias ll 'eza -al --icons'
  alias lt 'eza -a --tree --level=1 --icons'
	alias startdocker 'sudo systemctl start docker'
  alias cat bat
  alias c clear
	alias cd z
  alias gc "git commit -m"
  alias ga "git add ."
  alias gp "git push origin main"
  alias gi "git init -b main"
  alias gs "git status"
  alias sv "sudo nvim"
  alias shitdown "systemctl poweroff"
  alias confish "nvim ~/.config/fish/config.fish"
  # alias conf3 "sudo nvim ~/dotfiles/.config/sway/config"
  # alias bar "~/.config/polybar/launch.sh --cuts"
  alias n nmtui
  alias reboot "systemctl reboot"
  # alias wall "~/scripts/change-wall.sh"
  # alias cprog "gcc ./$1.c -o $1.out && ./$1.out"
  # alias todo "cd ~/todos/ && bun run todoOperations.ts "
end

zoxide init fish | source

set --export PATH $HOME/.flutter/flutter/bin/ $PATH
set --export PATH $HOME/Games/UltimMC/bin/ $PATH
# set --export PATH $HOME/Android/Sdk/platform-tools/ $PATH
# set --export PATH $HOME/Android/Sdk/cmdline-tools/latest/bin/ $PATH
source $HOME/Android/flutter.fish
