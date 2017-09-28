autoload -U colors && colors

# on Mac
if [ "$(uname -s)" = "Darwin" ]; then
    alias code='open -a "Visual Studio Code.app"'
fi

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

    elif [ -r "/usr/local/opt/nvm/nvm.sh" ]; then

        # the nvm is install by brew
        set_nvm_up $nvm_dir "/usr/local/opt/nvm/nvm.sh"

    else

        echo "$fg[red]No nvm is installed, please install it"\
            "via homebrew or clone it's repo to $HOME/.nvm"

    fi
fi
