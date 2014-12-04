###Git cheat sheet

Make new branch from origin
    git checkout -b feature/new_branch_name origin/develop

Push new feature branch with upstream checking to remote
    git push -u origin feature/new_branch_name

See all branches (local and remote)
    git branch -a

Preferentially resolve conflicts in one direction or another:
    git checkout --theirs file.txt
    git checkout --ours file.txt

No fast forward on merge (preserves old branches)
    git merge --no-ff

Graphical git log
    git log --graph --oneline

Git configurations
    git config --list

Retrieve all remotes
    fit fetch --all