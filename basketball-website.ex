defmodule BasketballWebsite do
  def extract_from_path(data, path) do
    nested_search(data, String.split(path, "."))
  end

  defp nested_search(:nil, _list), do: :nil
  defp nested_search(data, []), do: data
  defp nested_search(data, [head | tail]), do: nested_search(data[head], tail)


  def get_in_path(data, path) do
    get_in(data, String.split(path, "."))
  end
end
