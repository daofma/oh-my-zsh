PROMPT='%{$fg[magenta]%}%n%{$reset_color%} at %{$fg[yellow]%}%m%{$reset_color%} in %{$fg_bold[green]%}${PWD/#$HOME/~}%{$reset_color%}$(scm_prompt_info)
%# '

ZSH_THEME_SCM_PROMPT_ORDER='${zsh_scm_info_type}${zsh_scm_info_branch}${zsh_scm_info_tags}${zsh_scm_info_dirty}${zsh_scm_info_branch_status}${zsh_scm_info_patches}'

ZSH_THEME_SCM_PROMPT_GIT="git"
ZSH_THEME_SCM_PROMPT_HG="hg"
ZSH_THEME_SCM_PROMPT_PREFIX=""
ZSH_THEME_SCM_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_SCM_BRANCH_PREFIX=" on %{$fg[magenta]%}"
ZSH_THEME_SCM_BRANCH_SUFFIX="%{$reset_color%}"
ZSH_THEME_SCM_TAGS_PREFIX=" at %{$fg[yellow]%}"
ZSH_THEME_SCM_TAGS_SEP="%{$reset_color%}, %{$fg[yellow]%}"
ZSH_THEME_SCM_TAGS_SUFFIX="%{$reset_color%}"
ZSH_THEME_SCM_PATCHES_PREFIX=" %{$fg[yellow]%}"
ZSH_THEME_SCM_PATCHES_SEP="→"
ZSH_THEME_SCM_PATCHES_PREAPPLIED="%{$fg[yellow]%}"
ZSH_THEME_SCM_PATCHES_PREUNAPPLIED="%{$fg_bold[black]%}"
ZSH_THEME_SCM_PATCHES_POSTAPPLIED="%{$reset_color%}"
ZSH_THEME_SCM_PATCHES_POSTUNAPPLIED="%{$reset_color%}"
ZSH_THEME_SCM_PATCHES_SUFFIX="%{$reset_color%}"
ZSH_THEME_SCM_PROMPT_DIRTY="%{$fg[green]%}!"
ZSH_THEME_SCM_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_SCM_PROMPT_CLEAN=""
ZSH_THEME_SCM_PROMPT_AHEAD="↑"
ZSH_THEME_SCM_PROMPT_DIVERGED="↕"
ZSH_THEME_SCM_PROMPT_BEHIND="↓"
