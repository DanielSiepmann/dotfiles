source ~/.profile

# Resource of some configurations:
# - http://wiki.gentoo.org/wiki/Zsh/HOWTO
# - http://dougblack.io/words/zsh-vi-mode.html

# Documentation of options: http://zsh.sourceforge.net/Doc/Release/Options.html

# Load further scripts to extend zsh
# E.g. load further completions for apachectl and other programs
fpath=(/usr/local/share/zsh-completions $fpath)
fpath=(~/.dotfiles/zsh/completions/zsh-completions/src $fpath)

# Initialize colors.
autoload -U colors && colors
autoload -U promptinit
autoload -U compinit && compinit
autoload -U complist

# Change folder without "cd"
setopt autocd

# Set vim mode
set -o vi
bindkey -v

# Reduce timeout after <ESC>
export KEYTIMEOUT=1

# Allow editing of current line in $EDITOR using command mode V
autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# ctrl-r starts searching history backward
bindkey '^r' history-incremental-search-backward

################################################################################
#
#                                   History
#
################################################################################
export HISTSIZE=2000
export HISTFILE="$HOME/.zsh_history"
export SAVEHIST=$HISTSIZE
# Ignore dupicates in history, no protocol, just reverse search for faster reuse
setopt hist_ignore_all_dups
# Don't save commands prefixed with an empty space
setopt hist_ignore_space
# Share history in multiple instances
# setopt sharehistory
# Persist timestamp and duration beside the command
setopt extended_history

################################################################################
#
#                                   Autocompletion
#
################################################################################
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'
zstyle ':completion:*' menu select
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

# Show full information on completion (chmod, modified, ...)
# zstyle ':completion:*' file-list all
# zstyle ':completion:*' group-name ''
# zstyle ':completion:all-files*' list-colors 'di=36;40:ln=1;36;40:so=0;40:pi=0;40:ex=1;31;40:bd=0;40:cd=0;40:su=0;41:sg=0;40:tw=0;40:ow=0;40:'
zstyle ':completion:*:default' list-colors 'ma=1;36'
# zstyle ':completion:*:options:*' list-colors '=^(-- *)=36' '=(-- *)=1;30'

# zstyle ':completion:*:matches' group 'yes'
# zstyle ':completion:*:options' description 'yes'
# zstyle ':completion:*:options' auto-description '%d'
# zstyle ':completion:*:descriptions' format $'\e[01;33m -- %d --\e[0m'

# also complete defined alias
setopt completealiases
# Correct mistyped commands
setopt correctall
# Try to make the completion list smaller (occupying less lines) by printing the matches in columns with different widths.
setopt list_packed
# When listing files that are possible completions, show the type of each file with a trailing identifying mark.
setopt list_types
#
################################################################################
#
#                                   Versioning output
#
################################################################################
# See: http://zsh.sourceforge.net/Doc/Release/User-Contributions.html
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable hg git
# Configure features to use
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' get-revision true
zstyle ':vcs_info:*' use-simple false

# Add remote compare: http://eseth.org/2010/git-in-zsh.html
# Show remote ref name and number of commits ahead-of or behind
function +vi-git-st() {
    local ahead behind remote
    local -a gitstatus

    # Are we on a remote-tracking branch?
    remote=${$(git rev-parse --verify ${hook_com[branch]}@{upstream} \
        --symbolic-full-name 2>/dev/null)/refs\/remotes\/}

    if [[ -n ${remote} ]] ; then
        ahead=$(git rev-list ${hook_com[branch]}@{upstream}..HEAD 2>/dev/null | wc -l)
        read  -rd '' ahead <<< "$ahead"
        (( $ahead )) && gitstatus+=( "${c3}⇡${ahead}${c2}" )

        behind=$(git rev-list HEAD..${hook_com[branch]}@{upstream} 2>/dev/null | wc -l)
        read  -rd '' behind <<< "$behind"
        (( $behind )) && gitstatus+=( "${c4}↯${behind}${c2}" )

        hook_com[branch]="${hook_com[branch]}"
        if [[ -n $gitstatus ]]; then
            hook_com[branch]="${hook_com[branch]} %{$fg[red]%}${(j:/:)gitstatus}"
        fi
    fi
}
zstyle ':vcs_info:git*+set-message:*' hooks git-st git-stash

# Style output for VCS:
# http://arjanvandergaag.nl/blog/customize-zsh-prompt-with-vcs-info.html
zstyle ':vcs_info:*' formats "%{$fg[yellow]%}%b %i %u%m%c${reset_color}"
zstyle ':vcs_info:*' actionformats "%{$fg[red]%}%a %{$fg[yellow]%}%s %b %m%u%c${reset_color}"
# hash changes branch misc
zstyle ':vcs_info:*:*' branchformat "%b"
#zstyle ':vcs_info:*:*' hgrevformat "%{$fg[white]%}:%r${reset_color}"
zstyle ':vcs_info:*' stagedstr "%{$fg[green]%}s${reset_color}"
zstyle ':vcs_info:*' unstagedstr "%{$fg[red]%}u${reset_color}"

# Executed before each prompt
function precmd {
    vcs_info
}

# Set VIMMODE for prompt
# If I am using vi keys, I want to know what mode I'm currently using.
# zle-keymap-select is executed every time KEYMAP changes.
# From http://zshwiki.org/home/examples/zlewidgets
# FROM http://pthree.org/2009/03/28/add-vim-editing-mode-to-your-zsh-prompt/ AND http://zshwiki.org/home/examples/zlewidgets
# function zle-line-init zle-keymap-select {
#     VIMODE="${${KEYMAP/vicmd/M}/(main|viins)/I}"
#     zle reset-prompt
# }
# zle -N zle-line-init
# zle -N zle-keymap-select

# Allow for functions in the prompt.
setopt PROMPT_SUBST
# DEFINE PROMPT
#rubyV="Ruby:$(ruby -v | cut -f2 -d ' ')"
#phpV="PHP:$(php -v | grep built | cut -f2 -d' ')"
PROMPT=$'\n%{$fg[green]%}%D{%I:%M:%S%p} %{$fg[cyan]%}%~${reset_color%}\n${vcs_info_msg_0_} %{$reset_color%}\n$ '
#PROMPT=$'%{$fg[green]%}%D{%I:%M:%S%p}|%{$fg[cyan]%}%n %~${reset_color%}${vcs_info_msg_0_} %{$reset_color%}\n$ '
#RPROMPT='%{$fg[white]$bg[black]%} ${vcs_info_msg_0_} %{$fg[green]%}${VIMODE}|%?|%# %{$reset_color%}'

if [[ $(hostname) =~ "euve" ]]; then
    PROMPT=$'\n%{$fg[red]%}%D{%I:%M:%S%p} %n %{$fg[cyan]%}%~${reset_color%}\n${vcs_info_msg_0_} %{$reset_color%}\n$ '
fi

eval "$(rbenv init -)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Has to be included as last statement to work
# Highlight of user input, e.g. red if command is unknown and green if known,
# yellow for strings. ...
if [[ -f "/usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]]; then
    source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

function present {
    PROMPT=$'\n%D{%I:%M:%S%p} %~ \n$ '
    export PRESENT=1
    touch /tmp/present
    export LSCOLORS='AxAxcxdxGxegedabagacad'
    if [ $TMUX ]; then
        tmux source-file ~/.dotfiles/tmux/present.conf;
    fi
}

function presentStop {
    unset PRESENT
    tmux source-file ~/.tmux.conf;
    rm /tmp/present
    source ~/.zshrc
}
if [[ -f "/tmp/present" ]]; then
    present
fi
