# Prompt Config

Documentation and config files for prompt and terminal emulator customization


## Introduction

Originally this repository was a guide on how to install and use Starship inspired by a [youtube video](https://www.youtube.com/watch?v=NfggT5enF4o&t=719s). It evolved to be much more than a simple guide and storing basic configurations, also storing configurations for shells, terminal emulators and scripts. Everything here is supposed to be multi-platform unless stated otherwise.

## Font

The setup described on this repository assumes [FiraCode](https://github.com/tonsky/FiraCode) is installed on the system, specially the Mono variant. I recommend obtaining it from [NerdFonts](https://www.nerdfonts.com/font-downloads) which provides several developer fonts already patched with a large [catalog](https://www.nerdfonts.com/cheat-sheet) of icons and symbols. Alternatively, at least a font with ligatures and patched with extra symbols is required. On Linux I installed with Font Manager, on Mac with FontBook and on Windows just by double clicking it.

## Terminal Emulator: Ghostty

Ghostty works for both mac and linux as of now and apparently a Windows version is planned. It's highly performant and its configuration is a text file. After Ghostty is installed, the configuration file can be replaced by a symlink, pointing to the one on this repository.

In case the Windows terminal is used, the font can be adjusted on Settings > Default > Appearance (same for background opacity).

## Prompt: Starship

After following the installation guide that's usually just running a script, configure it to use the config file provided by this repository.

If you don't plan to use Zsh (on Mac) or Bash (WSL and Linux) then at this point you must configure your shell to activate starship as described by the installation script.

## Dev Tools Management: Mise

I highly recommend having mise installed. It's a lightweight prompt injection that manages dev tools, environment variables and tasks. Mise can not only manage versions for several languages (think of it as nvm & rvm together) but also several developer tools, similarly to how languages are managed and exactly like a dependencies manager. It allows to easily replicate a development environment without having to resort to containers. Even if a certain project doesn't have a mise config, you can create your own mise.local.toml file to keep your environment consistent for that project. Same for your whole system, you could always have your set of developer tools managed with a ~/.config/mise/config.toml file.

## Shell

If you are using either Zsh on Mac or Bash on WSL/Linux, you can directly use the RC files from this repository.

## Configuring VSCode

I recommend just syncing your settings. In case of first installation, here goes a tip on how to configure the font:

1. Open Windows settings and check for the actual font name. In this case, it's "FiraCode NFM" (for Monospace).
2. Configure VSCode as follows:
    * `"editor.fontFamily": "'FiraCode NF'"`
    * `"terminal.integrated.fontFamily": "'FiraCode NFM'"`
    * `"editor.fontLigatures": true`

## Installation Script

To display all the necessary commands to configure **Ghostty**, RC files, **Starship** and **Mise**, simply execute the `install-commands.sh` script on this repository. The script is **not** destructive, won't mess up with your current configs. The script will only show the commands that should be executed in order to:
1. Delete existing config files
2. Create symlinks to the files on this repository on the proper locations on your system

⚠️ Before actually executing any command shown by the script, make sure to back up files that will be removed.