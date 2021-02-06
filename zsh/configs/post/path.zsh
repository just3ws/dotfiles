# ensure dotfiles bin directory is loaded first

path=(
  $HOME/.bin
  $HOME/.asdf/bin
  /usr/local/opt/postgresql@10/bin
  /usr/local/bin
  /usr/bin
  /bin
  /usr/local/sbin
  /usr/sbin
  /sbin
  $path
)

source '/usr/local/opt/asdf/asdf.sh'

# https://thoughtbot.com/blog/git-safe
# # mkdir .git/safe in the root of repositories you trust
# PATH=".git/safe/../../bin:$PATH"

export -U path 
