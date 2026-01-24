#!/usr/bin/env bash

################################################################################
# This script shows the necessary commands to install the current prompt and
# tools configurations in the user's home directory.
#
# Previous configuration files aren't removed and these ones aren't copied on
# purpose, to avoid losing data in case something goes wrong.
#
# Always double check all commands and make sure the removed files are backed up
# before applying destructive commands.
################################################################################

# Switch to the directory where this script is located because of all relative paths it uses
cd "$(dirname $0)" >/dev/null 2>&1;

echo "--------------------- Start installation script ----------------------------------------------------";

# Git ##########################################################################

GITCONFIG_BASE_LOCATION=$PWD/git;
GITIGNORE_GLOBAL_TARGET_LOCATION=$HOME/.gitignore-global;

echo -e "echo \"# Git\"";
echo "ln -fs $GITCONFIG_BASE_LOCATION/gitconfig $HOME/.gitconfig;";
if uname -a | grep -i darwin > /dev/null 2>&1; then
    echo "ln -fs $GITCONFIG_BASE_LOCATION/gitignore-global-mac $GITIGNORE_GLOBAL_TARGET_LOCATION;";
else
    echo "ln -fs $GITCONFIG_BASE_LOCATION/gitignore-global-linux $GITIGNORE_GLOBAL_TARGET_LOCATION;";
fi

# Ghostty ######################################################################

GHOSTTY_CONFIG_LOCATION=$PWD/ghostty/config;

if uname -a | grep -i microsoft > /dev/null 2>&1; then
    echo -e "\n⚠️ Ghostty isn't available on Windows";
elif uname -a | grep -i darwin > /dev/null 2>&1; then
    echo -e "\necho \"# Ghostty configs for MacOS\"";
    echo "ln -fs $GHOSTTY_CONFIG_LOCATION $HOME/Library/Application\ Support/com.mitchellh.ghostty/config;";
else
    echo -e "\necho \"# Ghostty configs for Linux\"";
    echo "ln -fs $GHOSTTY_CONFIG_LOCATION $HOME/.config/ghostty/config;";
fi

# RC ###########################################################################

# Base locations
RC_BASE_CONFIG_LOCATION=$PWD/rc;
RC_ALIASES_CONFIG_LOCATION=$RC_BASE_CONFIG_LOCATION/aliases;

# Base MacOS Locations
RC_BASE_MAC_CONFIG_LOCATION=$RC_BASE_CONFIG_LOCATION/zsh-mac;

# Base Linux Locations
RC_BASE_LINUX_CONFIG_LOCATION=$RC_BASE_CONFIG_LOCATION/bash-wsl-linux;

# Linux Target Locations
BASHRC_LINUX_CONFIG_LOCATION=$HOME/.bashrc;

if uname -a | grep -i darwin > /dev/null 2>&1; then
    echo -e "\necho \"# ZSH configs for MacOS\"";
    echo "ln -fs $RC_BASE_MAC_CONFIG_LOCATION/zshrc $HOME/.zshrc;";
    echo "ln -fs $RC_BASE_MAC_CONFIG_LOCATION/zprofile $HOME/.zprofile;";
    echo "ln -fs $RC_ALIASES_CONFIG_LOCATION $HOME/.zsh_aliases;";
else
    echo -e "\necho \"# Bash configs for Linux and WSL\"";
    echo "ln -fs $RC_BASE_LINUX_CONFIG_LOCATION/bashrc $HOME/.bashrc;";
    echo "ln -fs $RC_BASE_LINUX_CONFIG_LOCATION/git-completion.bash $HOME/.;";
    echo "ln -fs $RC_ALIASES_CONFIG_LOCATION $HOME/.bash_aliases;";
fi

# Starship #####################################################################

STARSHIP_TARGET_PATH=$HOME/.config

echo -e "\necho \"# Starship config\"";
echo "mkdir -p $STARSHIP_TARGET_PATH;";
echo "ln -fs $PWD/starship/starship.toml $STARSHIP_TARGET_PATH/.;";

# Mise #########################################################################

MISE_TARGET_CONFIG_PATH=$HOME/.config/mise;

echo -e "\necho \"# Mise config\"";
echo "mkdir -p $MISE_TARGET_CONFIG_PATH;";
echo "ln -fs $PWD/mise/config.toml $MISE_TARGET_CONFIG_PATH/.;";

MISE_TASKS_LOCATION=$PWD/mise/tasks;
MISE_TARGET_TASKS_PATH=$MISE_TARGET_CONFIG_PATH/mise-tasks;

echo -e "\necho \"# Mise tasks\"";
echo "mkdir -p $MISE_TARGET_TASKS_PATH";
ls $MISE_TASKS_LOCATION | xargs -I%TASK% echo "ln -fs $MISE_TASKS_LOCATION/%TASK% $MISE_TARGET_TASKS_PATH/.;";

echo "--------------------- End installation script ------------------------------------------------------";