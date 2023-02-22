# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZSH_THEME="powerlevel10k/powerlevel10k"

#Prompt
PS1="%F{green}%B%~/%b%f "

#Exports
export PATH="$HOME/.local/bin/:$PATH"
export ZSH=$HOME/.oh-my-zsh
export _JAVA_AWT_WM_NONREPARENTING=1

# OMZ
DISABLE_AUTO_UPDATE="true"
plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    vscode
    redis-cli
    python
    pod
    postgres
    mongocli
    minikube
    microk8s
    kubectl
    history
    heroku
    docker
    docker-compose
    )
source $ZSH/oh-my-zsh.sh

# Aliases
alias cls='clear'
alias py='python3'
alias pip='pip3'
alias open='xdg-open'
alias sudo='sudo -p "$(printf "\033[1;31mPassword: \033[0;0m" )"'
alias rm='printf "\033[1;31m" && rm -rIv'
alias cp='printf "\033[1;32m" && cp -rv'
alias mv='printf "\033[1;34m" && mv -v'
alias mkdir='printf "\033[1;33m" && mkdir -v'
alias rmdir='printf "\033[1;35m" && rmdir -v'
alias ls='exa --color=auto'
alias l='exa -lh --color=auto'
alias ll='exa -lah --color=auto'
alias la='exa -a --color=auto'
alias lm='exa -m --color=auto'
alias lr='exa -R --color=auto'
alias lg='exa -l --group-directories-first --color=auto'
alias gcl='git clone --depth 1'
alias gi='git init'
alias vim='nvim'
alias yt='ytfzf'
alias zshconfig="code ~/.zshrc"
alias ohmyzsh="code ~/.oh-my-zsh"
alias cat="bat"
alias npmlinkplugins="linkplugins"
alias lsts="tokei"
alias cargoupdate="cargo install $(cargo install --list | egrep '^[a-z0-9_-]+ v[0-9.]+:$' | cut -f1 -d' ')"

# History
HISTSIZE=500
SAVEHIST=1000
HISTFILE=.cache/zsh_history

# ASDF
. $HOME/.asdf/asdf.sh
# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)

# Tab completion
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# Binds
bindkey "^[[3~" delete-char
bindkey "^A" beginning-of-line
bindkey "^Q" end-of-line
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# Spicetify
export PATH="$PATH:$HOME/.spicetify"
export PATH=$PATH:/home/nsouza/.spicetify

# Kubectl
export PATH=$PATH:~/.local/bin/kubectl

# GO
export PATH=$PATH:/usr/local/go/bin

COMMAND_NOT_FOUND_INSTALL_PROMPT=1
source /home/nsouza/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# bit
export PATH="$PATH:/home/nsouza/bin"
# bit end

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

# Set JAVA_PATH and HOME
# . ~/.asdf/plugins/java/set-java-home.zsh
export JAVA_HOME=/usr/lib/jvm/java-17-oracle
export PATH=$PATH:$JAVA_HOME/bin

# Reshim asdf (NODE.JS)
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

# Add JBang to environment
alias j!=jbang
export PATH="$HOME/.jbang/bin:$PATH"

# Add Doom Emacs
export PATH="$HOME/.emacs.d/bin:$PATH"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# # Add SFTP SSH
# eval $(ssh-agent)
# ssh-add ~/.ssh/eir.prv

export EDI_PATH=/home/nsouza/Documents/Bolttech

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
