# Aliases
alias be='bundle exec'
alias ber='bundle exec rspec'
alias server='bundle exec rails s'
alias console='bundle exec rails c'
alias migrate='bundle exec rake db:migrate'
alias elasticsearch='elasticsearch --config=/opt/boxen/homebrew/opt/elasticsearch/config/elasticsearch.yml'
alias ls='ls -G'

# Git autocomplete: http://code-worrier.com/blog/autocomplete-git/
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

eval "$(rbenv init -)"
