# ls colors
autoload colors; colors;
export LSCOLORS="Gxfxcxdxbxegedabagacad"

# Enable ls colors
if [ "$DISABLE_LS_COLORS" != "true" ]
then
  # Find the option for using colors in ls, depending on the version: Linux or BSD
  ls --color -d . &>/dev/null 2>&1 && alias ls='ls --color=tty' || alias ls='ls -G'
fi

#setopt no_beep
setopt auto_cd
setopt multios
setopt cdablevarS

if [[ x$WINDOW != x ]]
then
    SCREEN_NO="%B$WINDOW%b "
else
    SCREEN_NO=""
fi

# Apply theming defaults
PS1="%n@%m:%~%# "

# version control theming default: Variables for theming the version control info prompt
ZSH_THEME_SCM_PROMPT_PREFIX=":("            # Prefix at the very beginning of the prompt
ZSH_THEME_SCM_PROMPT_SUFFIX=")"             # At the very end of the prompt
ZSH_THEME_SCM_PROMPT_DIRTY="*"              # Text to display if the working tree is dirty
ZSH_THEME_SCM_PROMPT_UNTRACKED=""           # Text to display if the working tree has files which are not tracked
ZSH_THEME_SCM_PROMPT_RENAMED=""             # Text to display if the working tree has renamed files
ZSH_THEME_SCM_PROMPT_MODIFIED=""            # Text to display if the working tree has modified files
ZSH_THEME_SCM_PROMPT_UNMERGED=""            # Text to display if the working tree has a merge in progress
ZSH_THEME_SCM_PROMPT_DELETED=""             # Text to display if the working tree has files which are deleted
ZSH_THEME_SCM_PROMPT_CLEAN=""               # Text to display if the working tree is clean
ZSH_THEME_SCM_PROMPT_SUFFIX=")"             # At the very end of the prompt
ZSH_THEME_SCM_BRANCH_PREFIX=""              # At the beginning of the current branch
ZSH_THEME_SCM_BRANCH_SUFFIX=""              # At the end of the current branch
ZSH_THEME_SCM_TAGS_PREFIX=""                # Before any tags
ZSH_THEME_SCM_TAGS_SEP=""                   # In between tags
ZSH_THEME_SCM_TAGS_SUFFIX=""                # After all tags
ZSH_THEME_SCM_PATCHES_PREFIX=""             # Before patches
ZSH_THEME_SCM_PATCHES_SEP=""                # Between all patches
ZSH_THEME_SCM_PATCHES_PREAPPLIED=""         # Before applied patches in queue
ZSH_THEME_SCM_PATCHES_PREUNAPPLIED=""       # Before unapplied patches in queue
ZSH_THEME_SCM_PATCHES_POSTAPPLIED=""        # After applied patches
ZSH_THEME_SCM_PATCHES_POSTUNAPPLIED=""      # After unapplied patches
ZSH_THEME_SCM_PATCHES_SUFFIX=""             # After all patches
ZSH_THEME_SCM_PROMPT_AHEAD=""               # If the local branch is ahead of the remote branch
ZSH_THEME_SCM_PROMPT_DIVERGED=""            # If the local branch is diverged from the remote branch
ZSH_THEME_SCM_PROMPT_BEHIND=""              # If the local branch is behind the remote branch
ZSH_THEME_SCM_PROMPT_GIT=""                 # If the current directory is in git
ZSH_THEME_SCM_PROMPT_HG=""                  # If the current directory is in mercurial
ZSH_THEME_SCM_PROMPT_CVS=""                 # If the current directory is in cvs
ZSH_THEME_SCM_PROMPT_SVN=""                 # If the current directory is in subversion

# clear out the scm info vars every time the prompt loads...
function clear_scm_info () {
export ZSH_SCM_INFO_TYPE=""
export ZSH_SCM_INFO_DIRTY=""
export ZSH_SCM_INFO_BRANCH=""
export ZSH_SCM_INFO_BRANCH_STATUS=""
export ZSH_SCM_INFO_PATCHES=""
export ZSH_SCM_INFO_TAGS=""
}

autoload -Uz add-zsh-hook
add-zsh-hook precmd clear_scm_info

# Setup the prompt with pretty colors
setopt prompt_subst

fpath+=${OMZ_HOME}/lib
fpath+=${OMZ_HOME}/themes
autoload -U promptinit
promptinit
