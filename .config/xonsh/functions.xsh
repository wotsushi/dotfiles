import os
import shutil
import json

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


def _bcd_cd():
    with open(expanduser('~/.config/bcd/fav.json')) as favs:
        favs = json.load(favs)
    directories = []
    for fav in favs:
        directories.append(fav)
        directories.append($(fd . @(expanduser(fav)) -t d))
    directory_line = $(echo @('\n'.join(directories)) | peco)
    if directory_line:
        directory, *_ = directory_line.split(':', maxsplit=1)
        cd @(directory.strip())


def _bcd_bookmark():
    with open(expanduser('~/.config/bcd/fav.json')) as favs:
        favs = json.load(favs)
    favs.append($(pwd).strip())
    with open(expanduser('~/.config/bcd/fav.json'), 'w') as favs_sink:
        json.dump(favs, favs_sink)


def _bcd_list():
    with open(expanduser('~/.config/bcd/fav.json')) as favs:
        favs = json.load(favs)
    print('\n'.join(f'{i:02} {fav}'for i, fav in enumerate(favs)))


def _bcd(args):
    if len(args) == 0:
        _bcd_cd()
    elif len(args) == 1:
        if args[0] == 'b':
            _bcd_bookmark()
        if args[0] == 'l':
            _bcd_list()
