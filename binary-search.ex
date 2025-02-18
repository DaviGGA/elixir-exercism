defmodule BinarySearch do
  @doc """
    Searches for a key in the tuple using the binary search algorithm.
    It returns :not_found if the key is not in the tuple.
    Otherwise returns {:ok, index}.

    ## Examples

      iex> BinarySearch.search({}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 5)
      {:ok, 2}

  """

  @spec search(tuple, integer) :: {:ok, integer} | :not_found
  def search(numbers, key) do
    search(numbers, key, 0)
  end

  def search(numbers, key, index) do
    middle = get_middle(numbers);
    IO.puts(middle)
    middle_element = elem(numbers, middle);

    cond do
      middle_element == key -> {:ok, index}
      middle_element < key ->
        search(tuple_slice(numbers, middle + 1, middle), key, index + middle + 1)
      middle_element > key ->
        search(tuple_slice(numbers, 0, middle), key, middle)
    end
  end

  def search({}, _key, _index), do: {:not_found}

  defp get_middle(numbers) do
    numbers_size = tuple_size(numbers)
    cond do
      rem(numbers_size, 2) == 0 -> (numbers_size / 2) - 1
      else -> numbers_size |> div(2);
    end
  end

  defp tuple_slice(tuple, first, length) do
    tuple
    |> Tuple.to_list()
    |> Enum.slice(first, length)
    |> List.to_tuple
  end
end
