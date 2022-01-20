Elixir
======


## Set up

Install via [`asdf`](https://github.com/asdf-vm/asdf).


## Symlink IEx config

```bash
$ ln -s ~/.dotfiles/Elixir/iex.symlink ~/.iex.exs
```

## Other Projects

For other project-specific `.iex.exs` files, include the following line:

```elixir
import_file_if_available("~/.dotfiles/Elixir/iex.global.exs")
```
