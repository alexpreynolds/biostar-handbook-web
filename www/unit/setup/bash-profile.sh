# Aliases are a way to create shortcuts to more complex commands
alias ls='ls -hG'
# On linux use ls='ls -h --color'

# Safer versions of the default commands.
# Will ask permission to overwrite your files.
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'

# Extend the path to include a bin folder
# located in your home directory.
export PATH=~/bin:$PATH

# The incantation below is extremely ugly.
# Thankfully once you set it you'll never need to see it again.
# Makes you terminal prompt nice, short and informative.
# We can't really live withouth it.
export PS1='\[\e]0;\w\a\]\n\[\e[32m\]\u@\h \[\e[33m\]\w\[\e[0m\]\n\$ '
