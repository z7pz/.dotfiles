alias projects='cd ~/Documents/projects'
# alias reload='omz reload' # source ~/.zshrc
alias zshc='code ~/.oh-my-zsh/custom'

# reload the current command instance
reload() {
  if test ! -x "$(command -v "omz")"; then

    echo "Reloading..." &&
      omz reload &&
      return 0
  fi

  . "$HOME/.zshrc"

  echo "Sourced $HOME/.zshrc"
}

# copy to clipboard
copytxt() {
  xsel --clipboard
}

# cat as single line
lat() {
  cat $1 | tr -d "\n"
}

# Create git message (for commits)
cgm() {
  echo "Generating a new message..."
  msg=$(curl -sk https://whatthecommit.com/index.txt)
  echo "message: $msg"
  echo "\n\n"
  read -r "res? Continue? [Y] - if you want to exit press (CTRL + C): "
  if [[ "$res" =~ ^([yY][eE][sS]|[yY])$ ]]; then
    git commit -m "$msg"
  else
    cgm
  fi
}
