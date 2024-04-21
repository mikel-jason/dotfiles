# if downloaded as zip, submodules are not present
f="$_SETUP/modules/zsh-autosuggestions/zsh-autosuggestions.zsh"
if [[ -a "$f" ]]; then
    source "$_SETUP/modules/zsh-autosuggestions/zsh-autosuggestions.zsh"
fi
