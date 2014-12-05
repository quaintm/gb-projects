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

Git force pull to overwrite local files
    git fetch --all
    git reset --hard origin/master
    git pull origin master 

Rename local branch
    git branch -m <oldname> <newname>


Show merged branches
    git branch -a --merged

Don't show deleted remotes:
    git remote prune your_remote

Delete already-merged branches
Local
    git branch -d branch_name
Remote
    git push your_remote :branch_name


Adding to $fish_user_paths=
    set fish_user_paths $fish_user_paths my_path

Setting Sublime as default editor
    ln -s "/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl" ~/bin/subl
  add to fish config:
    setenv EDITOR 'subl -w'
