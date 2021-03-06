# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="thedelchop"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=( bundler heroku gem git git-flow node npm osx pow powder rails3 rake redis-cli ruby rvm vi-mode)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/Users/thedelchop/.rvm/gems/ruby-1.9.3-p0/bin:/Users/thedelchop/.rvm/gems/ruby-1.9.3-p0@global/bin:/Users/thedelchop/.rvm/rubies/ruby-1.9.3-p0/bin:/Users/thedelchop/.rvm/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin

export PAPERWOVEN_AWS_ACCESS_KEY_ID=AKIAJIXOY3EUHNB7JI3A
export PAPERWOVEN_AWS_SECRET_ACCESS_KEY=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
export PAPERWOVEN_AWS_BUCKET=paperwoven-development
