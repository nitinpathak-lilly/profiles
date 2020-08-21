# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

HISTSIZE=10000
HISTFILESIZE=10000
SAVEHIST=$HISTSIZE

############## Aliases ####################
alias history="history -i 1"
alias trc="ssh c242525-ds@brainiac-login-0004.am.lilly.com"
alias rcop="chef exec rubocop"
alias fcrit="chef exec foodcritic"
alias gpom="git pull origin master"
alias gpod="git pull origin develop"
alias dsc="ssh c242525-ds@saarthi.am.lilly.com"
alias awskitchen="KITCHEN_YAML="kitchen.lilly-dev-igw-dx-lrl-hpc.yml" kitchen"
alias venvnt_aws="source /Users/c242525/Workspace/aws/bin/activate"
alias lz_aws_login="lilly_aws_auth login lz_dev_hpc_admins"
alias ia1="ssh brainiac-ia-0001"
alias ia2="ssh brainiac-ia-0002"
alias ia3="ssh brainiac-ia-0003"
alias ia4="ssh brainiac-ia-0004"
alias ia5="ssh brainiac-ia-0005"
alias ia6="ssh brainiac-ia-0006"
alias ia7="ssh brainiac-ia-0007"
alias ia8="ssh brainiac-ia-0008"
############################################
# Setting prompt
source ~/.git-prompt.zsh
PROMPT='%F{green}%D{%A %d %b} %T%F{$reset_color%}:%F{cyan}%~%F{$reset_color%} $(git_info) 
%F{30}Command # %! %F{$reset_color%}%# ' 

export CLICOLOR=1
#export LSCOLORS=GxFxCxDxBxegedabagaced
export LSCOLORS=gxfxcxdxbxegedabagaced
