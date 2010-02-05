function cvs_prompt_info() {
  cvsstat=$(cvs status 2>/dev/null)

  if [[ $? != 0 ]]; then
    return
  fi
  zsh_scm_info_branch="$ZSH_THEME_SCM_BRANCH_PREFIX$(parse_cvs_branch $cvsstat)$ZSH_THEME_SCM_BRANCH_SUFFIX"
  zsh_scm_info_tag=""
  zsh_scm_info_dirty=$(parse_cvs_dirty $cvsstat)
  zsh_scm_info_branch_status=$(parse_cvs_branch_status $cvsstat)
  zsh_scm_info_patches=""
  zsh_scm_info_type="$ZSH_THEME_SCM_PROMPT_CVS"

  print -P "$ZSH_THEME_SCM_PROMPT_PREFIX$ZSH_THEME_SCM_PROMPT_ORDER$ZSH_THEME_SCM_PROMPT_SUFFIX"
}

parse_cvs_dirty () {
  cvsstat=$1

  if $(echo ${cvsstat} | grep -q "Status: Locally Modified"); then
    echo -n "$ZSH_THEME_SCM_PROMPT_DIRTY"
  fi

  #currently never reached, since CVS won't show status of untracked files
  if $(echo ${cvsstat} | grep -q "Status: Unknown"); then
    echo -n "$ZSH_THEME_SCM_PROMPT_UNTRACKED"
  fi

  if [[ -n $(echo ${cvsstat} | grep -q "\(Status: Locally Modified\)\|\(Status: Unknown\)") ]]; then
    echo -n "$ZSH_THEME_SCM_PROMPT_CLEAN"
  fi
}

# since CVS doesn't have local branches, user can only be behind, never
# diverged or ahead.
parse_cvs_branch_status () {
  cvsstat=$1

  if $(echo ${cvsstat} | grep -q "Status: Needs Patch"); then
    echo -n "$ZSH_THEME_SCM_PROMPT_BEHIND"
  fi
}

parse_cvs_branch () {
  cvsstat=$1

  echo ${cvsstat} | sed -n 's/^\s*Sticky Tag:\s*\(\S*\)$/\1/p'
}