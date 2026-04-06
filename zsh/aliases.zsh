alias reload!='. ~/.zshrc'
alias dotconfig="cd ~/.dotfiles && e"
alias ps="python3 -m http.server 8000"


# Navigation
alias ..="cd .."
alias cd..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."


# grc overides for ls
#   Made possible through contributions from generous benefactors like
#   `brew install coreutils`
if $(gls &>/dev/null)
then
  alias ls="gls -AFh --color --group-directories-first"
  alias l="gls -lAh --color"
  alias ll="gls -l --color"
  alias la='gls -A --color'
fi

alias lsd='ls -l | grep "^d"' # only directories

