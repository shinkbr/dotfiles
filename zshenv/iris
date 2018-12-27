# Taken from El Capitan's /etc/zprofile
# system-wide environment settings for zsh(1)
if [ -x /usr/libexec/path_helper ]; then
  setopt no_global_rcs
  eval `/usr/libexec/path_helper -s`
fi

# PATH
export PATH=$HOME/bin:$HOME/.bin:/usr/local/sbin:$PATH

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# nodenv
eval "$(nodenv init -)"

# adb
export PATH="$HOME/Library/Android/sdk/platform-tools:$PATH"
