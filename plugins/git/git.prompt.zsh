function git_prompt_info() {
	gitstat=$(git status --porcelain 2>/dev/null)

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
  gitstat=$1
  STATUS=""
  if $(echo "$INDEX" | grep '^?? ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_UNTRACKED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^A  ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_ADDED$STATUS"
  elif $(echo "$INDEX" | grep '^M  ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_ADDED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^ M ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_MODIFIED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^R  ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_RENAMED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^ D ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_DELETED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^UU ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_UNMERGED$STATUS"
  fi
  echo $STATUS
}

parse_git_branch_status () {
  gitstat=$(git branch -v | grep "^*")
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

