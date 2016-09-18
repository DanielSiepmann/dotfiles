# PATH
    export PATH=/usr/local/sbin:/usr/local/bin:/opt/local/bin:/opt/local/sbin:/Applications/VirtualBox.app/Contents/MacOS:$PATH
    export PATH=~/.composer/vendor/bin:$PATH
    export PATH=~/bin:~/.dotfiles/bin:~/.gem/ruby/2.0.0/bin:~/Library/Python/2.7/bin:~/.local/bin/:$PATH

# Configure PYTHON:
    # "fix" broken load order Only for python2?!
    export PYTHONPATH=$(python -c 'import sys; from os.path import expanduser; print ":".join([sys.path[0]] + [expanduser("~") + "/Library/Python/2.7/lib/python/site-packages/"] + [sys.path[-1]] + sys.path[1:-1])')

# Configure PHP:
    PHP_ENVIRONMENT='local'
    export TYPO3_CONTEXT='Development/dsiepmann'
    export $PHP_ENVIRONMENT

# Setting ag as the default source for fzf
    export FZF_DEFAULT_COMMAND='ag -g ""'
    export FZF_DEFAULT_OPTS='--color=bg:232,fg:249,hl:14,fg+:249,bg+:236,hl+:14,prompt:12,pointer:12,spinner:1'

# Export local
# See: https://wiki.archlinux.org/index.php/Locale
    export LC_ALL=en_US.UTF-8
    export LANG=en_US.UTF-8
    export LANGUAGE=en_US

# Configure rvm
    export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
    [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Configure supported colors and tmux
    # if [ -e /usr/share/terminfo/x/xterm-256color ]; then
    #     export TERM='xterm-256color'
    # else
    #     export TERM='xterm-color'
    # fi
    export TERM="screen-256color"
    alias tmux="tmux -2"

# Setup docker on OS X
    # hash docker-machine && eval $(docker-machine env default)

# Configure default editor:
    # export EDITOR='"/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" -w'
    # export EDITOR='mvim -f'
    # export EDITOR='nvim'
    export EDITOR='vim'
    export VMAIL_VIM=mvim

# Allow xdebug to interact with sublime on CLI
    export XDEBUG_CONFIG="idekey=vim"

# Configure less!
    # export LESS='-R -M --shift 5' # Ferdinand
    # export LESS='-N -R'
    export LESS='-N -R -J -W'

# Configure colors
    export LS_OPTIONS='--color=auto'
    export CLICOLOR='Yes'
    export LSCOLORS='gxGxxxxxBxxxxxabxxxxxx' # I use this
    #export LSCOLORS='gxGxxxxxBxxxxabxxxx' # And this ist just for testing.

# Configure prompt
    export PS1="\[\033[0;32m\]\t|\[\033[1;36m\]\h[\u] \W >\[\033[0m\] "
    export SUDO_PS1="\[\033[41;1;33m\]\t|\h[\u] \W >\[\033[0m\] "

# ALIAS
    alias zshrc="source ~/.zshrc"

    alias rim="vim -R"

    alias ta="tmux attach"
    alias tc="tmux new-session -s "
    alias la="ls -laph"

    alias treea="tree -aNQ"
    alias treela="tree -aNQ -pugh"

    alias phpcbfwt='phpcbf --standard=WVTYPO3CMS'
    alias gphpcs='phpcs `git s | grep "^A\|\ M" | sed "s/A  //" | sed "s/ M //"` '
    alias gphpcsl='phpcs $(git show --pretty="format:" --name-only $1 | grep -v "^$" | uniq | sed -e "s#^#`git rev-parse`/#" | grep ".php$" | sed "s/\///")'

# GIT - TYPO3
    alias t3Push="git push origin HEAD:refs/for/master"
    alias t3Pull="git checkout master; git pull --rebase origin master; git checkout master"
    alias t3Rollback="git reset --hard HEAD^"

# Docker Aliases
    alias startJenkins="docker run -p 8080:8080 -p 50000:50000 dsiepmann/jenkins2"


# Environment specific
    if [[ $(hostname) = "soprano" ]]; then
        alias open='xdg-open'
        xmodmap ~/.xmodmaprc
    fi
