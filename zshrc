# Autocomplate
autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit
autoload -U colors && colors

# PATH
export PATH=~/bin:$PATH

# Alias
alias vi=vim
alias ll='ls -l'

# NVM
function set_nvm_up () {
    nvm_dir="$1"
    nvm_sh="$2"

    export NVM_DIR="$nvm_dir"
    . "$nvm_sh"
}

nvm_dir="$HOME/.nvm"

if [ -d "$nvm_dir" ]; then
    if [ -r "$NVM_DIR/nvm.sh" ]; then

        # the nvm is manual install via git
        set_nvm_up $nvm_dir "$NVM_DIR/nvm.sh"

    elif [ -r "/opt/homebrew/opt/nvm/nvm.sh" ]; then
        # the nvm is install by brew
        set_nvm_up $nvm_dir "/opt/homebrew/opt/nvm/nvm.sh"
	[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
    else

        echo "$fg[red]No nvm is installed, please install it"\
            "via homebrew or clone it's repo to $HOME/.nvm"

    fi
fi


# Support for Haskell
if command -v stack 1>&- 2>&-; then
  eval "$(stack --bash-completion-script stack)"
fi
