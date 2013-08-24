export PATH=/usr/local/share/npm/bin/:/usr/local/bin/:/usr/local/sbin/:/usr/bin/:/usr/local/lib/:$PATH

export NODE_PATH=$(npm -g root 2>/dev/null)

if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi
