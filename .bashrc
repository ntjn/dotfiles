#
# ~/.bashrc
#

HOME=$(
    [[ $USER != 'root' ]]&&
        echo "/home/$USER"||
        echo '/root'
)


# If not running interactively, don't do anything
[[ $- != *i* ]] && return


alias ls='ls --color=auto'
alias vi='vim -p'

if [ $(id -u) -eq 0 ];
then
	PS1="\342\224\214[${GREEN}\[\e[0;35;49m\u\e[0m${NC}] [\h]$ps1_informer:\[\e[0;35;49m\]\w\[\e[0m \n\342\224\224>"
else
	PS1="\342\224\214[${GREEN}\[\e[0;35;49m\u\e[0m${NC}] [\h]$ps1_informer:\[\e[0;35;49m\]\w\[\e[0m \n\342\224\224>"
fi


# Functions for convinience
function e() {
    [ -z $1 ] && (
        printf "\t%s\n" "Error: e is for running commands in background." >&2 && \
		return 1
    ) || \
	    $1 >/dev/null 2>&1 &
}

function l() {
	[ "$#" -eq 0 ]&&\
		ls -lah||(\
            [ -f $1 ]&&\
                cat "$@"||\
                ls -lah "$@"\
        )
}

# Enable extended globbing
shopt -s extglob

bind Space:magic-space

c() { gcc $1 -o `echo $1|sed -r 's/([^\.]*).*/\1.bin/'`; }

i3-sensible-terminal() { xterm; }

export PATH=~/.local/bin:$PATH

export ATHAME_TEST_RC=/home/ntj/.athamerc
export ATHAME_VIM_PERSIST=1
export ATHAME_SHOW_ERROR=1

T=0.85
[ -n "$XTERM_VERSION" ] && transset-df --id "$WINDOWID" $T >/dev/null

if [ -e /usr/share/terminfo/x/xterm-256color ]; then
        export TERM='xterm-256color'
else
        export TERM='xterm-color'
fi

export EDITOR=vim

f() { [ -z $2 ] && egrep -rnw . -e "$1" || egrep -rnw "$1" -e "$2"; }

# Examples

# find files containing REQUEST
# egrep -lir --include=*.java "(REQUEST)" .
