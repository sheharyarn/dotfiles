Elixir
======


## Kiex

Install Erlang and then install [Kiex](https://github.com/taylor/kiex), the Elixir version manager.

```bash
$ kiex list known
$ kiex install <version>
$ kiex use <version> --default

# or

$ kiex install $(kiex list known | tail -1)
```


## Phoenix

See the latest [Phoenix installation instructions](http://www.phoenixframework.org/docs/installation).


## Symlink IEx config

```bash
$ ln -s ~/.dotfiles/Elixir/iex.symlink ~/.iex.exs
```

