# Aliases
alias be='bundle exec'
alias ber='bundle exec rspec'
alias server='bundle exec rails s'
alias console='bundle exec rails c'
alias migrate='bundle exec rake db:migrate'
alias ls="ls -G" # color folders
alias cabify_rails="cd $HOME/code/cabify/cabify_server"

# Git autocomplete: http://code-worrier.com/blog/autocomplete-git/
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

eval "$(rbenv init -)"
### Added by the Heroku Toolbelt

export PATH="/usr/local/heroku/bin:$PATH"
