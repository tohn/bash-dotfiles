function ls {
	command ls -F --color=auto "$@"
}
function axel {
	command axel -n 10 -av "$@"
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
  mkdir -p "$1"
  cd "$1"
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

bak () {
	filename=$1
	filetime=$(date +%Y%m%d_%H%M%S)
	cp ${filename} ${filename}_${filetime}
}
