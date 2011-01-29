# enable color support of ls and also add handy aliases
#if [ -x /usr/bin/dircolors ]; then
    eval `dircolors -b /home/${USER}/.bash_dircolors` # eigene festlegung, aus: http://www.infodrom.org/~joey/Writing/freeX/console/
    # war mal eval `dircolors -b`
    #alias ls='ls --color=auto' # gibt ls farbig aus
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'
    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
#fi

# zur sicherheit
# Mit rm sollten keine Dateien geloescht werden, da diese nicht erst in den Muell verschoben werden!!!
# !!! Bedenke: 'sudo rm -rf /' loescht dein System !!!
alias rm='rm -i' # fragt ab, ob die datei wirklich geloescht werden soll, kann mit -f umgangen werden
alias cp='cp -i' # siehe oben, nur wird hier kopiert statt geloescht
alias mv='mv -i' # siehe oben, nur wird hier verschoben / umbenannt

# dateikram
alias b='cd ..' # entspricht hoch
#alias cd-='cd -' # entspricht zurueck
#alias l='ls -lh' # dateien mit dateirechten ausgeben
#alias ll='ls -lah' # _alle_ dateien mit dateirechten ausgeben
#alias lf='ls -CF' # markiert alle ausfuehrbaren dateien / ordner mit * oder /
#alias md=mkdir # kuerzel fuer ordner erstellen
#alias rd=rmdir # kuerzel fuer ordner loeschen

# sonstiges
#alias urxvt="urxvt -tr -sh 30 -fg gray +sb"
#alias m='mplayer -playlist ~/playlist.m3u -shuffle' # musik starten (mit mplayer + playlist) 
alias mu='mocp -S ; mocp -o shuffle, repeat ; mocp -p' # musik starten (mit mocp)
alias ba='/usr/bin/vim ~/.bash_aliases' # oeffnet vi und die datei
alias so='. ~/.bash_aliases' # laedt die datei neu
alias barc='/usr/bin/vim ~/.bashrc' # siehe oben
alias sorc='. ~/.bashrc' # siehe oben
#alias shot='scrot -d 5 -c -t 10' # bildschirmfoto
alias kal='clear; echo -n "Heutiges Datum: "date;echo;cal -3m' # kalender ausgeben mit vorigem, jetztigem und naechstem monat sowie heutiges datum
alias y=~/bin/yahato.sh # yahato starten
alias ya='vim ~/bin/yahato.sh' # yahato editieren
alias beep='sudo beep'
#alias away='mocp -P && slock' # mocp pausieren und slock aktivieren
alias away='echo pause | nc localhost 54311 && slock' # shell-fm pausieren und slock aktivieren
alias fa='feh -dFSname .' # bilder anzeigen
alias far='feh -dFSname -R *' # bilder rekursiv anzeigen

# Ubuntu
#alias pa='pulseaudio -k; pulseaudio -D' # pulseaudio daemon neustarten
alias get='sudo apt-get install' # installier ...
alias up='sudo apt-get update && sudo apt-get upgrade'

# ArchLinux
#alias x='startx ; logout'
#alias x='startx ; vlock -a' # x starten und bei error das virtuelle terminal locken
#alias x='startx'
#alias up='sudo pacman -Syu' # systemupdate ausfuehren
#alias lamp='sudo /etc/rc.d/httpd start && sudo /etc/rc.d/mysqld start' # apache starten
#alias vb='sudo modprobe vboxdrv' # virtualbox treiber laden
#alias hib='sudo hibernate -F /etc/hibernate/ususpend-disk.conf' # in den ruhezustand wechseln
#alias cups='sudo /etc/rc.d/cups start' # cups starten

# shell-fm
alias shell-fm='shell-fm -d'
alias inf='echo info %t by %a - %l on %s/%S | nc localhost 54311'
alias skip='echo skip | nc localhost 54311'
alias quit='echo quit | nc localhost 54311'
alias love='echo love | nc localhost 54311'
alias ban='echo ban | nc localhost 54311'

# Verschiedene Medien Mounten
alias sd='sudo mount -t auto /dev/mmcblk0p1 /media/sd' # sdkarte mounten
alias cdr='sudo mount -t auto /dev/cdrom /media/cdrom0' # cd mounten
alias dvd='sudo mount -t auto /dev/dvd /media/dvd' # dvd mounten
