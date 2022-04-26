#~/.bashrc
#-----------------------------------
# Source global definitions (if any)
#-----------------------------------

if [ -f /etc/bashrc ]; then
    . /etc/bashrc   # --> Read /etc/bashrc, if present.
fi

#-----------------------------------
# Process/system related functions:
#-----------------------------------

function my_ps()
{ ps $@ -u $USER -o pid,%cpu,%mem,bsdtime,command ; }

function pp()
{ my_ps f | awk '!/awk/ && $0~var' var=${1:-".*"} ; }

function my_ip() # get IP adresses
{
  MY_IP=$(/sbin/ifconfig ppp0 | awk '/inet/ { print $2 } ' | \
sed -e s/addr://)
  MY_ISP=$(/sbin/ifconfig ppp0 | awk '/P-t-P/ { print $3 } ' | \
sed -e s/P-t-P://)
}

function ii()   # get current host related info
{
  echo -e "\nYou are logged on ${RED}$HOST"
  echo -e "\nAdditionnal information:$NC " ; uname -a
  echo -e "\n${RED}Users logged on:$NC " ; w -h
  echo -e "\n${RED}Current date :$NC " ; date
  echo -e "\n${RED}Machine stats :$NC " ; uptime
  echo -e "\n${RED}Memory stats :$NC " ; free
  my_ip 2>&- ;
  echo -e "\n${RED}Local IP Address :$NC" ; echo ${MY_IP:-"Not connected"}
  echo -e "\n${RED}ISP Address :$NC" ; echo ${MY_ISP:-"Not connected"}
  echo
}



#---------
# Prompt:
#---------

function proml {
  local BLUE="\[\033[0;34m\]"
  local RED="\[\033[0;31m\]"
  local LIGHT_RED="\[\033[1;31m\]"
  local WHITE="\[\033[1;37m\]"
  local NO_COLOUR="\[\033[0m\]"
  case $TERM in
    xterm*|rxvt*)
    TITLEBAR='\[\033]0;\u@\h:\w\007\]'
    ;;
    *)
    TITLEBAR=""
    ;;
  esac

  PS1="$BLUE[$RED\$(date +%H:%M)$BLUE]$BLUE[$LIGHT_RED\u@\h:\w$BLUE]$WHITE\$$NO_COLOUR "
  PS2='> '
  PS4='+ '
}

proml

