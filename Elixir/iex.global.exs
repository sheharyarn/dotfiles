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
  Get deep value in a nested struct or map
  """
  def get(map, keys) do
    keys = if is_list(keys), do: keys, else: [keys]
    keys = Enum.map(keys, &Access.key/1)
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

end
