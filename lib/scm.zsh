function scm_prompt_info {
	echo "$(git_prompt_info)$(hg_prompt_info)$(cvs_prompt_info)"
}
