function hg_prompt_info {
	hg prompt --angle-brackets "$ZSH_THEME_SCM_PROMPT_PREFIX\
<$ZSH_THEME_SCM_BRANCH_PREFIX<branch>$ZSH_THEME_SCM_BRANCH_SUFFIX>\
<$ZSH_THEME_SCM_TAGS_PREFIX<tags|$ZSH_THEME_SCM_TAGS_SEP>$ZSH_THEME_SCM_TAGS_SUFFIX>\
<status|modified($ZSH_THEME_SCM_PROMPT_DIRTY)|unknown($ZSH_THEME_SCM_PROMPT_UNTRACKED)|clean($ZSH_THEME_SCM_PROMPT_CLEAN)>\
<$ZSH_THEME_SCM_PATCHES_PREFIX<patches|join($ZSH_THEME_SCM_PATCHES_SEP)|pre_applied($ZSH_THEME_PATCHES_PREAPPLIED)|pre_unapplied($ZSH_THEME_PATHCES_PREUNAPPLIED)|post_applied($ZSH_THEME_PATCHES_POSTAPPLIED)|post_unapplied($ZSH_THEME_PATCHES_POSTUNAPPLIED)>$ZSH_THEME_SCM_PATCHES_SUFFIX>" 2>/dev/null
}

# Aliases
# none here yet
