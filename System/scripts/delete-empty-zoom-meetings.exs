defmodule DeleteEmptyZoomRecordings do
  require Logger

  # Format: 2023-06-20 15.32.55 Sheharyar's Zoom Meeting
  @folder_regex ~r/^20\d{2}-\d{2}-\d{2} \d{2}.\d{2}.\d{2} .+$/
  @default_root Path.expand("~/Documents/Zoom/")

  def run(root \\ @default_root) do
    Logger.warn("Deleting empty zoom recordings in: #{root}")

    root
    |> File.ls!()
    |> Enum.map(fn name ->
      path = Path.join(root, name)

      if delete?(name, path) do
        File.rm_rf!(path)
        Logger.warn("-- Deleting: #{name}")
      else
        Logger.info("-- Skipping: #{name}")
      end
    end)
  end

  defp delete?(name, path) do
    with true <- File.dir?(path),
         true <- String.match?(name, @folder_regex) do
      case File.ls!(path) do
        [f] -> String.ends_with?(f, ".txt")
        [] -> true
        _fs -> false
      end
    else
      _other -> false
    end
  end
end

DeleteEmptyZoomRecordings.run()
