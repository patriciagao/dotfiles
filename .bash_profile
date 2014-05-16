eval "$(rbenv init -)"
source ~/.git-completion.bash
[ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh

# Aliases
alias tumx='tmux -2'
alias be='bundle exec'
alias ber='bundle exec rspec'
alias migrate=' bundle exec rake db:migrate'
alias migrate_test='bundle exec rake db:migrate RAILS_ENV=test'

