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
