import os

def _peco_gitlog():
    commit_line = $(git log --oneline | peco)
    if commit_line:
        commit, *_ = commit_line.split()
        git show @(commit)


def _peco_rg(args):
    rg_line = $(rg @(args) | peco)
    if rg_line:
        file, *_ = rg_line.split(':', maxsplit=1)
        bat @(file)


def _peco_ghq():
    repository = $(ghq list -p | peco).strip()
    if repository:
        cd @(repository)


def _mkdir_cd(name):
    directory, *_ = name
    os.makedirs(directory, exist_ok=True)
    cd @(directory)
