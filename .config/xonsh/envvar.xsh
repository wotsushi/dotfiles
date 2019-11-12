$PROMPT = '{BOLD_GREEN}[ {cwd} ]\n$ '
$RIGHT_PROMPT = "{branch_color} {gitstatus}"
$AUTO_PUSHD = True
$AUTO_CD = True
$DIRSTACK_SIZE = 100
$HISTCONTROL = {'ignoredups', 'ignoreerr'}

$PYENV_ROOT = '~/.anyenv/envs/pyenv'
$PATH = [
    '$PYENV_ROOT/shims',
    '$PYENV_ROOT/bin',
    '$HOME/.cargo/bin',
    '/home/linuxbrew/.linuxbrew/bin',
    '/usr/local/bin',
    '/usr/bin',
    '/bin',
    '/sbin'
]
