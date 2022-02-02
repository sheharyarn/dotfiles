defmodule H do
  @moduledoc """
  Global IEx Helpers

  To use this module, call this at the top of your project's
  local `.iex.exs` file:

    import_file_if_available("~/.dotfiles/Elixir/iex.global.exs")

  Then use any of the available functions under the `H` module
  namespace.
  """


  @doc """
  Get deep value in a nested struct, map or list of struct/maps
  """
  def get(list, keys) when is_list(list) do
    Enum.map(list, &get(&1, keys))
  end

  def get(%{} = map, keys) do
    keys = keys |> List.wrap() |> Enum.map(&Access.key/1)
    get_in(map, keys)
  end


  @doc """
  Print map/lists as JSON
  """
  def to_json(map) do
    map
    |> Jason.encode!(pretty: true)
    |> IO.puts()
  end


  @doc """
  Pretty print existing JSON object
  """
  def format_json(binary) do
    binary
    |> Jason.decode!()
    |> to_json()
  end


  @doc """
  Copy to clipboard
  """
  def copy(term) do
    text =
      if is_binary(term) do
        term
      else
        inspect(term, limit: :infinity, pretty: true)
      end

    port = Port.open({:spawn, "pbcopy"}, [])
    true = Port.command(port, text)
    true = Port.close(port)

    :ok
  end


  @doc """
  Finds a loaded module with that name

  ```
  module(PermissionCache)
  module(Reporter, :teenymetrics)
  ```
  """
  def module(name, app \\ nil) do
    case modules(name, app) do
      [mod | _] -> mod
      _else -> nil
    end
  end

  def modules(name, app \\ nil) do
    name =
      cond do
        Regex.regex?(name) -> Regex.source(name)
        is_atom(name) -> inspect(name)
        true -> to_string(name)
      end

    name_regex = ~r/^Elixir.*#{name}$/

    all_modules =
      case app do
        nil ->
          Enum.map(:code.all_loaded(), &elem(&1, 0))

        app ->
          {:ok, mods} = :application.get_key(app, :modules)
          mods
      end

    Enum.filter(all_modules, & to_string(&1) =~ name_regex)
  end


  @doc """
  Finds and aliases a loaded module with that name
  """
  defmacro alias(name, app \\ nil) do
    name = Macro.expand(name, __CALLER__)
    app = Macro.expand(app, __CALLER__)
    module = module(name, app)

    quote(do: alias unquote(module))
  end


end
