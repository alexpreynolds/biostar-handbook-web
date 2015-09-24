#
# Customize this file for your needs.
#

# Aliases are a way to customize command names

# This is for Mac OSX.
alias ls='ls -hG'

# On linux use the following:
# alias ls='ls -h --color'

# Safe versions of the default commands.
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'

# Extend the path to add the ~/bin folder.
export PATH=~/bin:$PATH

# This makes the prompt much more user friendly.
# But it does look ridiculous.
export PS1='\[\e]0;\w\a\]\n\[\e[32m\]\u@\h \[\e[33m\]\w\[\e[0m\]\n\$ '
