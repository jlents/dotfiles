# Making my command prompt look so pretty
export PS1='\[\033[0;92m\]xor\033[0m\]:\[\033[0;36m\]\W\033[0m\]$'

export PATH=$PATH:~/bin

# Who doesn't love aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias back='cd -'
alias ll='ls -Gll'
alias la='ls -Gla'
alias lla='ls -Glla'
alias ps='ps -ax'
alias grep='grep --color=auto'
alias finder='open .'
alias reload='source ~/.bash_profile'
alias goprojects='cd ~/projects'
alias gobin='cd ~/bin'
