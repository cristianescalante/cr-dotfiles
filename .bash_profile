# .bash_profile
# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi
# alias
# The 'ls' family (this assumes you use the GNU ls)
alias la='ls -Al --color'  # show hidden files
alias ls='ls -hF --color'  # add colors for filetype recognition
alias lx='ls -lXB --color' # sort by extension
alias lk='ls -lSr --color' # sort by size
alias lc='ls -lcr --color' # sort by change time
alias lu='ls -lur --color' # sort by access time
alias lr='ls -lR --color'  # recursive ls
alias lt='ls -ltr --color' # sort by date
alias lm='ls -al  --color|more'    # pipe through 'more'
alias tree='tree -Csu'     # nice alternative to 'ls'


# ORACLE VARIABLES
export NLS_LANG="AMERICAN_AMERICA.WE8ISO8859P1"
export LD_ASSUME_KERNEL=2.4.21
export ORACLE_HOME=/iG/dbms/oracle/product/9.2.0
export ORA_NLS=$ORACLE_HOME/ocommon/nls/admin/data
export LD_LIBRARY_PATH=$ORACLE_HOME/lib:/lib:/usr/lib:/usr/local/lib

export PATH=$PATH:$HOME/bin:$ORACLE_HOME/bin
unset USERNAME

