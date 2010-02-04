# ls colors
autoload colors; colors;
export LSCOLORS="Gxfxcxdxbxegedabagacad"
#export LS_COLORS

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
ZSH_THEME_SCM_PROMPT_DIRTY="*"              # Text to display if the branch is dirty
ZSH_THEME_SCM_PROMPT_UNTRACKED=""           # Text to display if the branch has files which are not tracked
ZSH_THEME_SCM_PROMPT_CLEAN=""               # Text to display if the branch is clean
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
ZSH_THEME_SCM_PROMPT_GIT="git"              # If the current directory is in git
ZSH_THEME_SCM_PROMPT_HG="hg"                # If the current directory is in mercurial

# use the following variables to construct the SCM part of the prompt
# ${zsh_scm_info_type}            the scm type (from git or hg above)
# ${zsh_scm_info_branch}          the current branch (including prefix/suffix)
# ${zsh_scm_info_tags}            current tags
# ${zsh_scm_info_dirty}           dirty/clean/untracked status text
# ${zsh_scm_info_branch_status}   ahead/diverged/behind status text
# ${zsh_scm_info_patches}         list of patches in queue
ZSH_THEME_SCM_PROMPT_ORDER='${zsh_scm_info_type}${zsh_scm_info_branch}${zsh_scm_info_tags}${zsh_scm_info_dirty}${zsh_scm_info_branch_status}${zsh_scm_info_patches}'

# Setup the prompt with pretty colors
setopt prompt_subst

# Load the theme
source "$ZSH/themes/$ZSH_THEME.zsh-theme"
