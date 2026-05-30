#!/usr/bin/env bash

####################################################################################################
# This script shows the necessary commands to install the current prompt and tools configurations in
# the user's home directory.
#
# Previous configuration files aren't removed and these ones aren't copied on purpose, to avoid
# losing data in case something goes wrong.
#
# Always double check all commands and make sure the removed files are backed up before applying
# destructive commands.
####################################################################################################

# Switch to the directory where this script is located because of all relative paths it uses
cd "$(dirname $0)" >/dev/null 2>&1;

# Check shell ######################################################################################

SUPPORTED_SHELLS=("zsh" "bash");
CURRENT_SHELL=$(basename $SHELL);
if [[ "${SUPPORTED_SHELLS[*]}" =~ "$CURRENT_SHELL" ]]; then
    echo "Supported shell: $CURRENT_SHELL.";
else
    echo -e "\033[0;31mError\033[0m: unsupported shell $CURRENT_SHELL.";
    echo -e "Expected one of the following: ${SUPPORTED_SHELLS[*]}";
    exit 1;
fi

echo "--------------------------- Start installation script --------------------------";

# RC ###############################################################################################

TARGET_EXTRA_CONFIG_LOCATION=$HOME/.$CURRENT_SHELL;
echo "mkdir -p $TARGET_EXTRA_CONFIG_LOCATION;";

LOCAL_BASE_RC_LOCATION=$PWD/rc;
case $CURRENT_SHELL in
    bash)
        echo -e "\n##### Bash configs for Linux and WSL ###########################################";
        LOCAL_RC_LOCATION=$LOCAL_BASE_RC_LOCATION/bash-wsl-linux;
        echo "ln -fs $LOCAL_RC_LOCATION/bashrc $HOME/.bashrc;";
        echo "ln -fs $LOCAL_RC_LOCATION/git-completion.bash $TARGET_EXTRA_CONFIG_LOCATION/.;";
        ;;
    zsh)
        echo -e "\n##### Zsh configs for MacOS ####################################################";
        LOCAL_RC_LOCATION=$LOCAL_BASE_RC_LOCATION/zsh-mac;
        echo "ln -fs $LOCAL_RC_LOCATION/zshrc $HOME/.zshrc;";
        echo "ln -fs $LOCAL_RC_LOCATION/zprofile $HOME/.zprofile;";
        ;;
esac;
echo "ln -fs $LOCAL_BASE_RC_LOCATION/aliases $TARGET_EXTRA_CONFIG_LOCATION/.;";

# Git ##############################################################################################

GITCONFIG_BASE_LOCATION=$PWD/git;
GIT_CONFIGS_TARGET_LOCATION=$HOME/.git;

echo -e "\n##### Git configs ##############################################################";
echo "ln -fs $GITCONFIG_BASE_LOCATION/gitconfig $HOME/.gitconfig;";
echo "mkdir -p $GIT_CONFIGS_TARGET_LOCATION;";
echo "ln -fs $GITCONFIG_BASE_LOCATION/ignore $GIT_CONFIGS_TARGET_LOCATION/.;";

# Ghostty ##########################################################################################

GHOSTTY_CONFIG_LOCATION=$PWD/ghostty/config;

if uname -r | grep -i microsoft > /dev/null 2>&1; then
    echo -e "\n##### ⚠️ Ghostty isn't available on Windows ####################################";
elif uname -a | grep -i darwin > /dev/null 2>&1; then
    echo -e "\n##### Ghostty configs for MacOS ################################################";
    echo "ln -fs $GHOSTTY_CONFIG_LOCATION $HOME/Library/Application\ Support/com.mitchellh.ghostty/config;";
else
    echo -e "\n##### Ghostty configs for Linux ################################################";
    echo "ln -fs $GHOSTTY_CONFIG_LOCATION $HOME/.config/ghostty/config;";
fi

# Starship #########################################################################################

STARSHIP_TARGET_PATH=$HOME/.config

echo -e "\n##### Starship config ##########################################################";
echo "mkdir -p $STARSHIP_TARGET_PATH;";
echo "ln -fs $PWD/starship/starship.toml $STARSHIP_TARGET_PATH/.;";

# Mise #############################################################################################

MISE_TARGET_CONFIG_PATH=$HOME/.config/mise;

echo -e "\n##### Mise config ##############################################################";
echo "mkdir -p $MISE_TARGET_CONFIG_PATH;";
echo "ln -fs $PWD/mise/config.toml $MISE_TARGET_CONFIG_PATH/.;";

MISE_TASKS_LOCATION=$PWD/mise/tasks;
MISE_TARGET_TASKS_PATH=$MISE_TARGET_CONFIG_PATH/tasks;

echo -e "\n##### Mise tasks ###############################################################";
echo "mkdir -p $MISE_TARGET_TASKS_PATH";
echo "ln -fs $MISE_TASKS_LOCATION/* $MISE_TARGET_TASKS_PATH;";

echo "--------------------------- End installation script ----------------------------";