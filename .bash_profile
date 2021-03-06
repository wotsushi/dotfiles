export PYENV_ROOT="$HOME/.anyenv/envs/pyenv"
export PATH="$HOME/.goenv/shims:$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
export XONSHRC="~/.config/xonsh/rc.xsh:~/.config/xonsh/envvar.xsh:~/.config/xonsh/functions.xsh:~/.config/xonsh/keybindings.xsh:~/.config/xonsh/alias.xsh:~/.config/xonsh/import.xsh"

xonsh
