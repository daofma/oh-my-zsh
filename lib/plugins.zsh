#!/usr/bin/env zsh

autoload -U add-zsh-hook

# Load all of the plugins that were defined in ~/.zshrc
plugin=${plugin:=()}
for plugin ($plugins);
do
    # Add the plugin's dir to fpath
    fpath+=${OMZ_HOME}/plugins/$plugin

    # Source the plugin itself
    source ${OMZ_HOME}/plugins/$plugin/$plugin.plugin.zsh

    # Load hook functions from all of the plugins that were defined in ~/.zshrc
    for hook in chpwd precmd preexec periodic zshaddhistory zshexit;
    do
        if [[ -a ${OMZ_HOME}/plugins/${plugin}/${plugin}_${hook} ]];
        then
            autoload ${plugin}_${hook}
            add-zsh-hook ${hook} ${plugin}_${hook}
        fi
    done

    # Hook any prompt_info functions into precmd as well
    if [[ -a ${OMZ_HOME}/plugins/$plugin/${plugin}_prompt_info ]];
    then
        autoload ${plugin}_prompt_info
        add-zsh-hook precmd ${plugin}_prompt_info
    fi
done
