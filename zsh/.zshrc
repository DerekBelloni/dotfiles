# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH="/usr/local/bin:$PATH"
export PATH=/opt/homebrew/bin:$PATH
export C_INCLUDE_PATH=/opt/homebrew/opt/sdl2/include/SDL2
export LIBRARY_PATH=/opt/homebrew/opt/sdl2/lib
export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"
export PATH="$HOME/nvim-macos-arm64/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="$PATH:/Applications/WezTerm.app/Contents/MacOS"
alias jarvis-d='docker exec -it new-jarvis-web-1 bash'
. "/Users/derekbelloni/.deno/env"

source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# history setup
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify
# completion using arrow keys (based on history)
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward
# ---- Eza (better ls) -----
alias ls="eza --icons=always"
# ---- Zoxide (better cd) ----
eval "$(zoxide init zsh)"

alias cd="z"
