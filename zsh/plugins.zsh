if [[ -a "$_SETUP/modules/zsh-autosuggestions/zsh-autosuggestions.zsh" ]]; then
    source "$_SETUP/modules/zsh-autosuggestions/zsh-autosuggestions.zsh"
fi

# syntax highlighting and substring search go last
if [[ -a "$_SETUP/modules/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]]; then
    source "$_SETUP/modules/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi

if [[ -a "$_SETUP/modules/zsh-history-substring-search/zsh-history-substring-search.zsh" ]]; then
    source "$_SETUP/modules/zsh-history-substring-search/zsh-history-substring-search.zsh"

    bindkey "$terminfo[kcuu1]" history-substring-search-up
    bindkey "$terminfo[kcud1]" history-substring-search-down

    export HISTORY_SUBSTRING_SEARCH_PREFIXED="1"
fi
