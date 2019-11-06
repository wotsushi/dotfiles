from prompt_toolkit.filters import Condition, EmacsInsertMode, ViInsertMode


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


aliases['gitlog'] = _peco_gitlog
aliases['rgp'] = _peco_rg
aliases['l'] = "exa -hla --git"
aliases['ls'] = "exa"
aliases['lg'] = _peco_ghq

from math import *
from itertools import *
from functools import *
from collections import *
from os.path import *
