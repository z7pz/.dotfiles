alias projects='cd ~/Documents/projects'
# alias reload='omz reload' # source ~/.zshrc
alias zshc='code ~/.oh-my-zsh/custom'
alias dpush="git push --set-upstream origin master"

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
  res=$(curl -sk https://whatthecommit.com/index.txt)
  echo "message: $res"
  echo "\n\n"
  read -r "res? Continue? [Y] - if you want to exit press (CTRL + C): "
  if [[ "$res" =~ ^([yY][eE][sS]|[yY])$ ]]; then
    git commit -m "$res"
  else
    cgm
  fi
}
