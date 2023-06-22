export PATH=/usr/share/steam/compatibilitytools.d/proton-ge-custom/files/bin:/opt/android-sdk/platform-tools:/home/jake/.cargo/bin:/home/jake/.local/bin:/home/jake/kde/src/kdesrc-build:$PATH
export FZF_BASE=$ZSH/custom/plugins/fzf-zsh-plugin
export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh
source /etc/compiler.env
source /etc/environment
source /etc/zsh/aliases
source /etc/zsh/zenv
source /etc/zsh/zprofile
source /STORAGE/GIT/YT-DLS/SOURCE.rc

# kdesrc-build #################################################################

## Autocomplete for kdesrc-run
function _comp_kdesrc_run
{
  local cur
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"

  # Complete only the first argument
  if [[ $COMP_CWORD != 1 ]]; then
    return 0
  fi

  # Retrieve build modules through kdesrc-run
  # If the exit status indicates failure, set the wordlist empty to avoid
  # unrelated messages.
  local modules
  if ! modules=$(kdesrc-run --list-installed);
  then
      modules=""
  fi

  # Return completions that match the current word
  COMPREPLY=( $(compgen -W "${modules}" -- "$cur") )

  return 0
}

## Register autocomplete function
complete -o nospace -F _comp_kdesrc_run kdesrc-run
