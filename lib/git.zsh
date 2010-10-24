function git_prompt_info() {
	gitstat=$(git status 2>/dev/null)

	if [[ $? -eq 128 ]]; then
		return
	fi

	zsh_scm_info_branch="$ZSH_THEME_SCM_BRANCH_PREFIX$(current_branch)$ZSH_THEME_SCM_BRANCH_SUFFIX"
	zsh_scm_info_tag=""
	zsh_scm_info_dirty=$(parse_git_dirty $gitstat)
	zsh_scm_info_branch_status=$(parse_git_branch_status $gitstat)
	zsh_scm_info_patches=""
	zsh_scm_info_type="$ZSH_THEME_SCM_PROMPT_GIT"
	print -P "$ZSH_THEME_SCM_PROMPT_PREFIX$ZSH_THEME_SCM_PROMPT_ORDER$ZSH_THEME_SCM_PROMPT_SUFFIX"
}

parse_git_dirty () {
  gitstat=$(echo $1 | grep '\(# Untracked\|# Changes\|# Changed but not updated:\)')

  if echo ${gitstat} | grep -q "^# Changes to be committed:$"; then
	echo -n "$ZSH_THEME_SCM_PROMPT_DIRTY"
  fi

  if echo ${gitstat} | grep -q "^\(# Untracked files:\|# Changed but not updated:\)$"; then
	echo -n "$ZSH_THEME_SCM_PROMPT_UNTRACKED"
  fi 

  if [[ $(echo ${gitstat} | grep -v '^$' | wc -l | tr -d ' ') == 0 ]]; then
	echo -n "$ZSH_THEME_SCM_PROMPT_CLEAN"
  fi
}

parse_git_branch_status () {
  gitstat=$(echo $1 | grep "Your branch is")
  if [ $? ]; then
	if echo ${gitstat} | grep -q "ahead"; then
		echo -n "$ZSH_THEME_SCM_PROMPT_AHEAD"
	elif echo ${gitstat} | grep -q "diverged"; then
		echo -n "$ZSH_THEME_SCM_PROMPT_DIVERGED"
	elif echo ${gitstat} | grep -q "behind"; then
		echo -n "$ZSH_THEME_SCM_PROMPT_BEHIND"
	fi
  fi
}

#
# Will return the current branch name
# Usage example: git pull origin $(current_branch)
#
function current_branch() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo ${ref#refs/heads/}
}
