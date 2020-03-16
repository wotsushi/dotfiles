import os
from pathlib import Path

repo = Path(os.path.abspath(__file__)).parent.parent
print(repo)
home = Path.home()
dotfiles = [
    '.bash_profile',
    '.gitconfig',
    'com.googlecode.iterm2.plist',
    '.emacs.d',
    '.config/peco',
    '.config/xonsh'
]

for dotfile in dotfiles:
    (home / dotfile).parent.mkdir(parents=True, exist_ok=True)
    (home / dotfile).unlink(missing_ok=True)
    (home / dotfile).symlink_to(repo / dotfile, target_is_directory=True)
