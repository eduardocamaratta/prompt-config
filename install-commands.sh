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

# Git ##########################################################################

GITCONFIG_BASE_LOCATION="$PWD/git"
GITCONFIG_LOCATION="$GITCONFIG_BASE_LOCATION/gitconfig"
GITIGNORE_GLOBAL_MAC_LOCATION="$GITCONFIG_BASE_LOCATION/gitignore-global-mac"
GITIGNORE_GLOBAL_LINUX_LOCATION="$GITCONFIG_BASE_LOCATION/gitignore-global-linux"
GITCONFIG_TARGET_LOCATION="$HOME/.gitconfig"
GITIGNORE_GLOBAL_TARGET_LOCATION="$HOME/.gitignore-global"
echo "# Git configs"
echo "rm -f $GITCONFIG_TARGET_LOCATION"
echo "rm -f $GITIGNORE_GLOBAL_TARGET_LOCATION"
echo "ln -s $GITCONFIG_LOCATION $GITCONFIG_TARGET_LOCATION"

if uname -a | grep -i darwin > /dev/null 2>&1; then
    echo "ln -s $GITIGNORE_GLOBAL_MAC_LOCATION $GITIGNORE_GLOBAL_TARGET_LOCATION"
else
    echo "ln -s $GITIGNORE_GLOBAL_LINUX_LOCATION $GITIGNORE_GLOBAL_TARGET_LOCATION"
fi

# Ghostty ######################################################################

GHOSTTY_CONFIG_LOCATION="$PWD/ghostty/config"
GHOSTTY_LINUX_CONFIG_LOCATION="$HOME/.config/ghostty/config"
GHOSTTY_MAC_CONFIG_LOCATION="$HOME/Library/Application\ Support/com.mitchellh.ghostty/config"

echo ""
if uname -a | grep -i microsoft > /dev/null 2>&1; then
    echo "⚠️ Ghostty isn't available on Windows"
elif uname -a | grep -i darwin > /dev/null 2>&1; then
    echo "# Ghostty configs for MacOS"
    echo "rm -f $GHOSTTY_MAC_CONFIG_LOCATION"
    echo "ln -s $GHOSTTY_CONFIG_LOCATION $GHOSTTY_MAC_CONFIG_LOCATION"
else
    echo "# Ghostty configs for Linux"
    echo "rm -f $GHOSTTY_LINUX_CONFIG_LOCATION"
    echo "ln -s $GHOSTTY_CONFIG_LOCATION $GHOSTTY_LINUX_CONFIG_LOCATION"
fi

# RC ###########################################################################

# Base locations
RC_BASE_CONFIG_LOCATION="$PWD/rc"
RC_ALIASES_CONFIG_LOCATION="$RC_BASE_CONFIG_LOCATION/aliases"

# Base MacOS Locations
RC_BASE_MAC_CONFIG_LOCATION="$RC_BASE_CONFIG_LOCATION/zsh-mac"
RC_ZSHRC_MAC_CONFIG_LOCATION="$RC_BASE_MAC_CONFIG_LOCATION/zshrc"
RC_ZPROFILE_MAC_CONFIG_LOCATION="$RC_BASE_MAC_CONFIG_LOCATION/zprofile"

# MacOS Target Locations
ZSH_MAC_CONFIG_LOCATION="$HOME/.zshrc"
ZPROFILE_MAC_CONFIG_LOCATION="$HOME/.zprofile"
ALIASES_MAC_CONFIG_LOCATION="$HOME/.zsh_aliases"

# Base Linux Locations
RC_BASE_LINUX_CONFIG_LOCATION="$RC_BASE_CONFIG_LOCATION/bash-wsl-linux"
RC_BASHRC_LINUX_CONFIG_LOCATION="$RC_BASE_LINUX_CONFIG_LOCATION/bashrc"
RC_GITCOMPLETION_LINUX_CONFIG_LOCATION="$RC_BASE_LINUX_CONFIG_LOCATION/git-completion.bash"

# Linux Target Locations
BASHRC_LINUX_CONFIG_LOCATION="$HOME/.bashrc"
GITCOMPLETION_LINUX_CONFIG_LOCATION="$HOME/git-completion.bash"
ALIASES_LINUX_CONFIG_LOCATION="$HOME/.bash_aliases"

echo ""
if uname -a | grep -i darwin > /dev/null 2>&1; then
    echo "# ZSH configs for MacOS"
    echo "rm -f $ZSH_MAC_CONFIG_LOCATION"
    echo "rm -f $ZPROFILE_MAC_CONFIG_LOCATION"
    echo "rm -f $ALIASES_MAC_CONFIG_LOCATION"
    echo "ln -s $RC_ZSHRC_MAC_CONFIG_LOCATION $ZSH_MAC_CONFIG_LOCATION"
    echo "ln -s $RC_ZPROFILE_MAC_CONFIG_LOCATION $ZPROFILE_MAC_CONFIG_LOCATION"
    echo "ln -s $RC_ALIASES_CONFIG_LOCATION $ALIASES_MAC_CONFIG_LOCATION"
else
    echo "# Bash configs for Linux and WSL"
    echo "rm -f $BASHRC_LINUX_CONFIG_LOCATION"
    echo "rm -f $GITCOMPLETION_LINUX_CONFIG_LOCATION"
    echo "rm -f $ALIASES_LINUX_CONFIG_LOCATION"
    echo "ln -s $RC_BASHRC_LINUX_CONFIG_LOCATION $BASHRC_LINUX_CONFIG_LOCATION"
    echo "ln -s $RC_GITCOMPLETION_LINUX_CONFIG_LOCATION $GITCOMPLETION_LINUX_CONFIG_LOCATION"
    echo "ln -s $RC_ALIASES_CONFIG_LOCATION $ALIASES_LINUX_CONFIG_LOCATION"
fi

# Starship #####################################################################

STARSHIP_CONFIG_LOCATION="$PWD/starship/starship.toml"
STARSHIP_TARGET_CONFIG_LOCATION="$HOME/.config/starship.toml"

echo ""
echo "# Starship config"
echo "rm -f $STARSHIP_TARGET_CONFIG_LOCATION"
echo "ln -s $STARSHIP_CONFIG_LOCATION $STARSHIP_TARGET_CONFIG_LOCATION"

# Mise #########################################################################

MISE_CONFIG_LOCATION="$PWD/mise/config.toml"
MISE_TARGET_CONFIG_LOCATION="$HOME/.config/mise/config.toml"

echo ""
echo "# Mise config"
echo "rm -f $MISE_TARGET_CONFIG_LOCATION"
echo "ln -s $MISE_CONFIG_LOCATION $MISE_TARGET_CONFIG_LOCATION"