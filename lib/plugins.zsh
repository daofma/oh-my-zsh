#!/usr/bin/env zsh
#
# Load all of the plugins that were defined in ~/.zshrc
plugin=${plugin:=()}
for plugin ($plugins);
do
    # Add the plugin's dir to fpath
	fpath=($ZSH/plugins/$plugin $fpath)

    # Source the plugin itself
	source $ZSH/plugins/$plugin/$plugin.plugin.zsh

    # Load hook functions from all of the plugins that were defined in ~/.zshrc
    
    # chpwd
    if [[ -a $ZSH/plugins/$plugin/${plugin}_chpwd ]];
    then
        autoload ${plugin}_chpwd
        chpwd_functions=($chpwd_functions ${plugin}_chpwd)
    fi

    # periodic
    if [[ -a $ZSH/plugins/$plugin/${plugin}_periodic ]];
    then
        autoload ${plugin}_periodic
        periodic_functions=($periodic_functions ${plugin}_periodic)
    fi

    # precmd
    if [[ -a $ZSH/plugins/$plugin/${plugin}_precmd ]];
    then
        autoload ${plugin}_precmd
        precmd_functions=($precmd_functions ${plugin}_precmd)
    fi

    # preexec
    if [[ -a $ZSH/plugins/$plugin/${plugin}_preexec ]];
    then
        autoload ${plugin}_preexec
        preexec_functions=($preexec_functions ${plugin}_preexec)
    fi

    # zshaddhistory
    if [[ -a $ZSH/plugins/$plugin/${plugin}_zshaddhistory ]];
    then
        autoload ${plugin}_zshaddhistory
        zshaddhistory_functions=($zshaddhistory_functions ${plugin}_zshaddhistory)
    fi

    # zshexit
    if [[ -a $ZSH/plugins/$plugin/${plugin}_zshexit ]];
    then
        autoload ${plugin}_zshexit
        zshexit_functions=($zshexit_functions ${plugin}_zshexit)
    fi

    # Hook any prompt_info functions into precmd as well
    if [[ -a $ZSH/plugins/$plugin/${plugin}_prompt_info ]];
    then
        autoload ${plugin}_prompt_info
        precmd_functions=($precmd_functions ${plugin}_prompt_info)
    fi
done
