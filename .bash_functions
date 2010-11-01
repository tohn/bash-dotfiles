#function vlc {
#	command vlc "$@" >/dev/null 2>&1
#}

#function mplayer {
#	command mplayer "$@" >/dev/null 2>&1
#}

function ls {
	command ls -F --color=auto "$@"
}
function l {
	ls -lh "$@"
}
function ll {
	ls -lah "$@"
}
function la {
	ls -A "$@"
}
function lt {
	ls -lhtr "$@"
}

function dh {
	df -h "$@"
}

function v {
	command vim "$@"
}

function g {
	command grep -irs "$@"
}

function less {
	/usr/share/vim/vim73/macros/less.sh "$@"
}

function le {
	command less "$@"
}

function axel {
	command axel -n 10 -av "$@"
}

function yo {
	command yaourt "$@"
}

function tf {
	command tail -f "$@"
}

function mkdir {
  command mkdir -p "$@"
}

function grep {
  command grep -irs "$@"
}

function cal {
  command cal -m "$@"
}

function xpdf {
  command xpdf -z page "$@" &
}

function dusch {
        du -sch *
}

function du1 {
        if [ "$*" = "" ] ; then
                du -h --max-depth=1 --exclude=".?*" "`pwd`"
        else
                du -h --max-depth=1 --exclude=".?*" "$@"
        fi
}
function du2 {
        if [ "$*" = "" ] ; then
                du -h --max-depth=2 --exclude=".?*" "`pwd`"
        else
                du -h --max-depth=2 --exclude=".?*" "$@"
        fi
}

function psgrep {
  ps -eaf | grep --color=auto -i "$1"
}

function returncode {
        returncode=$?
        if [ $returncode -ne 0 ] ; then
                echo "$returncode"
        fi
}

function mkcd () {
  mkdir -p "$@"
  cd "$@"
}

###   Handy Extract Program
extract () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xvjf $1        ;;
            *.tar.gz)    tar xvzf $1     ;;
            *.bz2)       bunzip2 $1       ;;
            *.rar)       unrar x $1     ;;
            *.gz)        gunzip $1     ;;
            *.tar)       tar xvf $1        ;;
            *.tbz2)      tar xvjf $1      ;;
            *.tgz)       tar xvzf $1       ;;
            *.zip)       unzip $1     ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1    ;;
            *)           echo "'$1' cannot be extracted via >extract<" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}
