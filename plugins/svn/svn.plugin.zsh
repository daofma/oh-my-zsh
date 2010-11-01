#!/usr/bin/env zsh

autoload svn_parse_current_branch svn_parse_dirty svn_parse_branch_status

# Assume we didn't start in a git repo
export ZSH_SVN=128

