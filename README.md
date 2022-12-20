# Prompt Config

Documentation and config files for prompt customization


## General

First source material was the [youtube video](https://www.youtube.com/watch?v=NfggT5enF4o&t=719s) explaining the combination of ZSH, a new terminal called Warp, and Starship. This inspired me to look for cross-platform prompt configurations. Not very creative, but I decided to try the suggested [Starship](https://starship.rs/).


### Font

Using a fancy prompt starts by installing a font which supports symbols. A while ago Konrad Gibaszwesky showed me [FiraCode](https://github.com/tonsky/FiraCode), which has very nice ligatures. I could install it directly from the GitHub page, but a fancy prompt would require more symbols than the basic ones.

In order to achieve that, it's necessary to patch the chosen font with the wanted symbols. Fortunately this problem is already solved by [NerdFonts](https://www.nerdfonts.com/font-downloads) which provides several known developer fonts already patched with a large catalog of icons and symbols.

I selected **FiraCode Mono**, as it makes more sense (IMO) for both development and terminal usage.


## Windows

### Font

Install the font downloaded from NerdFonts for **all users**.


### Terminal

Configure the terminal to use it: Settings > Default > Appearance

### Starship

1. Install [Starship prompt](https://starship.rs/guide/#%F0%9F%9A%80-installation)
    * Run `curl -sS https://starship.rs/install.sh | sh`
    * Add `eval "$(starship init bash)"` to the end of the bashrc file
2. [Configure](https://starship.rs/config/#prompt) Starship
    * Run `mkdir -p ~/.config && touch ~/.config/starship.toml`
3. I started configuration by copying a preset from the internet and editing it. Source: https://www.maketecheasier.com/customize-linux-terminal-prompt-using-starship/

### Configuring VSCode

1. Open Windows settings and check for the actual font name. In this case, it's "FiraCode NFM" (for Monospace).
2. Configure VSCode as follows:
    * `"editor.fontFamily": "'FiraCode NF'"`
    * `"terminal.integrated.fontFamily": "'FiraCode NFM'"`
    * `"editor.fontLigatures": true`

## MacOS

### Font

Installed only the mono font, as it covers both cases (development and terminal). Installation was smooth and later font (and it's name) can be checked in the Font Book.

### VSCode

Use same strategy as used for Windows, but check the font name in Font Book. Everything will work, **except** the integrated terminal.

### Xcode

Also worked well just after selecting the desired font.

### Terminal

Just configuring the current terminal to use the chosen font worked as expected.

However, the default mac terminal doesn't handle the wide range of Foreground and Background colors used by Starship. For that I had to install iTerm2, in Preferences > Profiles > Text configure the same font for both ASCII and Non-ASCII, increase size to 15 and enable ligatures. With that configured, prompt looks the same as in Windows.

### Starship

1. Installation
    * Run `curl -sS https://starship.rs/install.sh | sh`
    * Enable in fish by appending `starship init fish | source` to `~/.config/fish/config.fish`
    * Copy the same TOML file used for Windows (after all it´s a cross-platform solution)