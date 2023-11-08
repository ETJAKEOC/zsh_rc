ZSH_THEME="agnoster"
#export FZF_BASE=$ZSH/custom/plugins/fzf-zsh-plugin
export ZSH=/usr/share/oh-my-zsh

source $ZSH/oh-my-zsh.sh
source /etc/environment
source /etc/profile
source /etc/zsh/zenv
source /etc/zsh/zstyle
source /STORAGE/GIT/YT-DLS/SOURCE.rc

####    ALIASES    ####

alias gen_pass="openssl rand -base64 20 | tr -dc 'a-zA-Z0-9' | head -c 20"

alias btrfs_balance='sudo btrfs balance start --full-balance -v'
alias btrfs_defrag='sudo btrfs filesystem defragment -r -v -czstd'
alias btrfs_clean='sudo btrfs check --clear-space-cache v2'
alias btrfs_size='sudo btrfs filesystem usage'

alias resource='source ~/.zshrc'

alias dfd='df -h -x tmpfs'
alias ls='eza -a --icons'
alias dus='sudo du -axhd1 | sort -n | sort -h'
alias lsblk='lsblk -f'
alias fdisk='sudo fdisk'
alias nano='nano -Llm'

alias lmakepkg='CC="/usr/bin/clang" CXX="/usr/bin/clang++" CPP="/usr/bin/clang-cpp" LD="/usr/bin/lld" LDFLAGS="-fuse-ld=lld" AR="/usr/bin/llvm-ar" RANLIB="/usr/bin/llvm-ranlib" NM="/usr/bin/llvm-nm" ADDR2LINE="/usr/bin/llvm-addr2line" OBJCOPY="/usr/bin/llvm-objcopy" OBJDUMP="/usr/bin/llvm-objdump" READELF="/usr/bin/llvm-readelf" STRIP="/usr/bin/llvm-strip" makepkg'
alias lmake="CC='/usr/local/bin/clang' CXX='/usr/local/bin/clang++' LD=ld.lld AR=llvm-ar NM=llvm-nm STRIP=llvm-strip OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump READELF=llvm-readelf HOSTCC='/usr/local/bin/clang' HOSTCXX='/usr/local/bin/clang++' HOSTAR=llvm-ar HOSTLD=ld.lld ccache make LLVM=1 LLVM_IAS=1"
alias clear-caches="sudo su -c 'sync; echo 3 > /proc/sys/vm/drop_caches'"

alias screen_dim="brightnessctl set 1 acpi_vide0"
alias screen_30="brightnessctl set 3 acpi_vide0"
alias screen_half="brightnessctl set 5 acpi_vide0"
alias screen_60="brightnessctl set 6 acpi_vide0"
alias screen_bright="brightnessctl set 10 acpi_vide0"

alias aria='aria2c -j 16 -x 16'
alias myip="curl http://ipecho.net/plain; echo"
alias weather='curl wttr.in'

alias yay-clean='yay -Qtdq'
alias yay-rebuild='yay -S --editmenu --save --rebuildtree $(pacman -Qmq)'
alias yay-remove='yay -Rsncu'

alias plex_down='sudo systemctl stop plexmediaserver'
alias plex_up='sudo systemctl restart plexmediaserver'

alias vpn_down='sudo pkill openvpn'
alias vpn_up='sudo openvpn --config /etc/openvpn/client/us-free-57.protonvpn.net.udp.ovpn --daemon --auth-user-pass /home/jake/Documents/protonvpn.txt'

alias GIT='cd /STORAGE/GIT && clear'

alias tkg-clean='sudo rm -rf linux-src-git linux*.zst logs pkg'

# kdesrc-build #################################################################

## Add kdesrc-build to PATH
export PATH="/home/jake/kde/src/kdesrc-build:$PATH"

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

################################################################################

