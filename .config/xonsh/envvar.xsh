$PROMPT = '{BOLD_GREEN}[ {cwd} ]\n$ '
$RIGHT_PROMPT = "{branch_color} {gitstatus}"
$AUTO_PUSHD = True
$AUTO_CD = True
$DIRSTACK_SIZE = 100
$HISTCONTROL = {'ignoredups', 'ignoreerr'}
$UPDATE_COMPLETIONS_ON_KEYPRESS = True

$PYENV_ROOT = '~/.anyenv/envs/pyenv'
$GOENV_ROOT = '~/.anyenv/envs/goenv'
$PATH = [
    '$PYENV_ROOT/shims',
    '$PYENV_ROOT/bin',
    '$GOENV_ROOT/bin',
    '~/.goenv/shims',
    '$HOME/.cargo/bin',
    '/home/linuxbrew/.linuxbrew/bin',
    '/usr/local/bin',
    '/usr/bin',
    '/bin',
    '/sbin'
]

$GOPATH = '$HOME/go'
