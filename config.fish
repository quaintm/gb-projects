set -g __fish_git_prompt_show_informative_status 2
set -g __fish_git_prompt_hide_untrackedfiles 1
set -g __fish_git_prompt_color_branch magenta
set -g __fish_git_prompt_showupstream "informative"
set -g __fish_git_prompt_char_upstream_ahead "↑"
set -g __fish_git_prompt_char_upstream_behind "↓"
set -g __fish_git_prompt_char_upstream_prefix ""
set -g __fish_git_prompt_char_untrackedfiles "…"
set -g __fish_git_prompt_char_conflictedstate "✖"
set -g __fish_git_prompt_char_cleanstate "✔"
set -g __fish_git_prompt_color_dirtystate cyan
set -g __fish_git_prompt_color_stagedstate yellow
set -g __fish_git_prompt_color_invalidstate red
set -g __fish_git_prompt_color_untrackedfiles $fish_color_normal
set -g __fish_git_prompt_color_cleanstate green
 
function fish_prompt --description 'Write out the prompt'
 
set -l last_status $status
 
if not set -q __fish_prompt_normal
set -g __fish_prompt_normal (set_color normal)
end
 
# PWD
set_color $fish_color_cwd
echo -n (prompt_pwd)
set_color normal
 
printf '%s ' (__fish_git_prompt)
 
if not test $last_status -eq 0
set_color $fish_color_error
end
 
echo -n '$ '
 
end

source $HOME/anaconda2/etc/fish/conf.d/conda.fish

set fish_greeting "Go get it, Monica"
set fish_user_paths $fish_user_paths ~/anaconda2/bin
set fish_user_paths $fish_user_paths /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/
