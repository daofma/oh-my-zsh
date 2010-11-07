#!/usr/bin/env zsh

# Initializes Oh My Zsh

# add a function path
fpath=(${OMZ_HOME}/functions $fpath)

# Load all of the config files in ~/oh-my-zsh that end in .zsh
# TIP: Add files you don't want in git to .gitignore
for config_file (${OMZ_HOME}/lib/*.zsh) source $config_file

# Load all of your custom configurations from custom/
for config_file (${OMZ_HOME}/custom/*.zsh) source $config_file

# Load plugins
source ${OMZ_HOME}/lib/plugins.zsh

# Check for updates on initial load...
if [ "$DISABLE_AUTO_UPDATE" = "true" ]
then
  return
else
  /usr/bin/env zsh ${OMZ_HOME}/tools/check_for_upgrade.sh
fi

export PERIOD=15
