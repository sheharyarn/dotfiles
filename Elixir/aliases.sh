# Elixir Aliases
# --------------

alias   ex='iex'
alias  exs='mix phoenix.server'
alias  exc='iex -S mix'
alias exsc='iex -S mix phoenix.server'

alias ex.reset='mix ecto.reset && MIX_ENV=test mix ecto.reset'
alias ex.reset.test='ex.reset && mix test'

