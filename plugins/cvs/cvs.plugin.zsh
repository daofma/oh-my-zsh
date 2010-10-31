#!/usr/bin/env zsh

autoload cvs_parse_branch_status cvs_parse_current_branch cvs_parse_dirty

# Assume we didn't start in a hg repo
export ZSH_CVS=256

