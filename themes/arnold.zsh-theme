#!/usr/bin/env zsh

PROMPT='%{$fg[magenta]%}%n%{$reset_color%} at %{$fg[yellow]%}%m%{$reset_color%} in %{$fg_bold[green]%}${PWD/#$HOME/~}%{$reset_color%} ${ZSH_SCM_INFO_TYPE} ${ZSH_SCM_INFO_BRANCH} ${ZSH_SCM_INFO_BRANCH_STATUS} ${ZSH_SCM_INFO_PATCHES} ${ZSH_SCM_INFO_TAGS}
%# '

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
