export PYENV_ROOT="$HOME/.anyenv/envs/pyenv"
export PATH="$PYENV_ROOT/bin:/home/linuxbrew/.linuxbrew/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
export XONSHRC="~/.config/xonsh/rc.xsh:~/.config/xonsh/envvar.xsh:~/.config/xonsh/keybindings.xsh"

xonsh
