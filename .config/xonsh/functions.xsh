import os
import shutil

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


def _oj_test(args):
    if len(args) == 2:
        contest, problem = args
        task = '{}_{}'.format(contest, problem)
    elif len(args) == 3:
        contest, problem, task = args
    elif len(args) == 4:
        contest, problem, _, error = args
        task = '{}_{}'.format(contest, problem)
    else:
        contest, problem, task, _, error = args
    test_dir = 'test/{}'.format(problem)
    shutil.rmtree(test_dir, ignore_errors=True)
    url = 'https://atcoder.jp/contests/{}/tasks/{}'.format(contest, task)
    oj d @(url) -d @(test_dir)
    rustup run 1.15.1 rustc @('{}.rs'.format(problem)) -o @('{}.out'.format(problem))
    if len(args) >= 4:
        oj t -d @('test/{}'.format(problem)) -c @('./{}.out'.format(problem)) -e @(error)
    else:
        oj t -d @('test/{}'.format(problem)) -c @('./{}.out'.format(problem))
