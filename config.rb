CONFIGS = {
    'ghostty' => {
        'files' => [
            {
                'config.ghostty' => {
                    'tags' => ['linux'],
                    'target_path' => '~/.config'
                }
            },
            {
                'config.ghostty' => {
                    'tags' => ['mac'],
                    'target_path' => '~/Library/Application Support/com.mitchellh.ghostty'
                }
            }
        ]
    },
    'git' => {
        'files' => [
            { 'gitconfig' => { 'target_name' => '.gitconfig' } },
            { 'ignore' => { 'target_path' => '~/.config/camaratta-dotfiles/git' } }
        ],
        'target_path' => '~'
    },
    'mise/config' => {
        'files' => [
            'config.toml'
        ],
        'target_path' => '~/.config/mise'
    },
    'mise/tasks' => {
        'files' => [
            'unused-tools.sh',
            'update-packages.sh'
        ],
        'target_path' => '~/.config/mise/tasks'
    },
    'shell' => {
        'files' => [
            {
                'bashrc' => {
                    'tags' => ['bash'],
                    'target_name' => '.bashrc'
                }
            },
            {
                'zprofile' => {
                    'tags' => ['zsh'],
                    'target_name' => '.zprofile'
                }
            },
            {
                'zshrc' => {
                    'tags' => ['zsh'],
                    'target_name' => '.zshrc'
                }
            },
            { 'aliases' => { 'target_path' => '~/.config/camaratta-dotfiles/shell' } },
            {
                'git-completion.bash' => {
                    'tags' => ['bash'],
                    'target_path' => '~/.config/camaratta-dotfiles/shell',
                    'url' => 'https://raw.githubusercontent.com/git/git/refs/tags/v$GIT_VERSION/contrib/completion/git-completion.bash'
                }
            }
        ],
        'target_path' => '~'
    },
    'starship' => {
        'files' => [
            'starship.toml'
        ],
        'target_path' => '~/.config'
    }
}