# my bashrc

# export env var
export EDITOR=vim
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export PATH=$PATH:~/freeman/bin

# allow inputing chinese in terminal
set convert-meta off
set meta-flag on
set output-meta on

# some more ls aliases
alias grep='grep --color=auto'
alias ls='ls -G'
alias ll='ls -alGF'
alias la='ls -GA'
alias l='ls -GCF'
alias sl='ls'
alias gcc='gcc -Wall'
alias g++='g++ -Wall'
alias clang='clang -Wall'
