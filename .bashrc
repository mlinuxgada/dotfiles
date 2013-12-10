export PERL_LOCAL_LIB_ROOT="/home/vmlinuz/perl5";
export PERL_MB_OPT="--install_base /home/vmlinuz/perl5";
export PERL_MM_OPT="INSTALL_BASE=/home/vmlinuz/perl5";
export PERL5LIB="/home/vmlinuz/perl5/lib/perl5/x86_64-linux:/home/vmlinuz/perl5/lib/perl5";
export PATH="/home/vmlinuz/perl5/bin:$PATH";
export MYSQL_PS1="mysql (\d)> "
export TERM="xterm-256color"

alias mysql='mysql -uroot -p --prompt="mysql (\d)> "'
alias xlock='xlock -mode matrix'
alias tmux="TERM=screen-256color-bce tmux"

