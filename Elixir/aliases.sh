# Elixir Aliases
# --------------

alias   ex='iex'
alias  exs='mix phx.server'
alias  exc='iex -S mix'
alias exsc='iex -S mix phx.server'

alias ex.reset='mix ecto.reset && MIX_ENV=test mix ecto.reset'
alias ex.reset.test='ex.reset && mix test'



# Other Settings
# --------------

# Enable Persistent Shell History (OTP 20+)
export ERL_AFLAGS="-kernel shell_history enabled"

