#.profile
export PS1="\u@\h \W $ "

############## Aliases ####################
alias trc="ssh c242525-ds@brainiac-login-0002.am.lilly.com"
alias rcop="chef exec rubocop"
alias fcrit="chef exec foodcritic"
alias gpom="git pull origin master"
alias gpod="git pull origin develop"
alias dsc="ssh c242525-ds@saarthi.am.lilly.com"
alias awskitchen="KITCHEN_YAML="kitchen.lilly-dev-igw-dx-lrl-hpc.yml" kitchen"
alias venvnt_aws="source /Users/c242525/Workspace/aws/bin/activate"
alias lz_aws_login="lilly_aws_auth login lz_dev_hpc_admins"
##########################################

if [[ -x /usr/bin/vim ]];then
  export EDITOR=vim
  alias view='vim -R'
else
  export EDITOR=vi
fi

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

HISTSIZE=10000
HISTFILESIZE=10000
HISTTIMEFORMAT="%d/%m/%y %T "

export PATH=$PATH:/Users/c242525/Library/Python/2.7/bin:/Users/c242525/.chefdk/gem/ruby/2.5.0/bin

# ADDING POWERLINE STUFF
#powerline-daemon -q
#POWERLINE_BASH_CONTINUATION=1
#POWERLINE_BASH_SELECT=1
#. $HOME/Library/Python/2.7/lib/python/site-packages/powerline/bindings/bash/powerline.sh

#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

##############Terminal theme#################
        RED="\[\033[0;31m\]"
       CYAN="\[\033[1;36m\]"
      GREEN="\[\033[0;32m\]"
       BLUE="\[\033[1;34m\]"
     PURPLE="\[\033[0;35m\]"
  LIGHT_RED="\[\033[1;31m\]"
LIGHT_GREEN="\[\033[1;32m\]"
      WHITE="\[\033[1;37m\]"
 LIGHT_GRAY="\[\033[0;37m\]"
 BK_LI_BLUE="\[\033[0;90m\]"
 COLOR_NONE="\[\e[0m\]"

# determine git branch name
function parse_git_branch(){
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# determine mercurial branch name
function parse_hg_branch(){
  hg branch 2> /dev/null | awk '{print " (" $1 ")"}'
}

# Determine the branch/state information for this git repository.
function set_git_branch() {
  # Get the name of the branch.
  branch=$(parse_git_branch)
  # if not git then maybe mercurial
  if [ "$branch" == "" ]
  then
    branch=$(parse_hg_branch)
  fi

  # Set the final branch string.
  BRANCH="${PURPLE}${branch}${COLOR_NONE} "
}

# Return the prompt symbol to use, colorized based on the return value of the
# previous command.
function set_prompt_symbol () {
  if test $1 -eq 0 ; then
      PROMPT_SYMBOL="\$"
  else
      PROMPT_SYMBOL="${LIGHT_RED}\$${COLOR_NONE}"
  fi
}

# Determine active Python virtualenv details.
function set_virtualenv () {
  if test -z "$VIRTUAL_ENV" ; then
      PYTHON_VIRTUALENV=""
  else
      PYTHON_VIRTUALENV="${BLUE}[`basename \"$VIRTUAL_ENV\"`]${COLOR_NONE} "
  fi
}

# Set the full bash prompt.
function set_bash_prompt () {
  # Set the PROMPT_SYMBOL variable. We do this first so we don't lose the
  # return value of the last command.
  set_prompt_symbol $?

  # Set the PYTHON_VIRTUALENV variable.
  set_virtualenv

  # Set the BRANCH variable.
  set_git_branch

  # Set the bash prompt variable.
  PS1="
${PYTHON_VIRTUALENV}${GREEN}\d \A${COLOR_NONE}:${CYAN}\w${COLOR_NONE}${BRANCH}
${BK_LI_BLUE}"Macbook"${COLOR_NONE} ${PROMPT_SYMBOL} "
}

# Tell bash to execute this function just before displaying its prompt.
PROMPT_COMMAND=set_bash_prompt
#########################################
