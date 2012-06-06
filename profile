
# MacPorts Installer addition on 2011-03-03_at_21:49:40: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

export DYLD_LIBRARY_PATH=/usr/local/mysql/lib:$DYLD_LIBRARY_PATH

source "$HOME/.rvm/scripts/rvm"

[[ -s "/Users/thedelchop/.rvm/scripts/rvm" ]] && source "/Users/thedelchop/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
