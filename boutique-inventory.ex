defmodule BoutiqueInventory do
  def sort_by_price(inventory) do
    Enum.sort_by(inventory, & &1.price, :asc)
  end

  def with_missing_price(inventory) do
    Enum.filter(inventory, & &1.price == nil)
  end

  def update_names(inventory, old_word, new_word) do
    Enum.map(inventory, &replace_name(&1, old_word, new_word))
  end

  defp replace_name(item, old_word, new_word) do
    item
    |> Map.get(:name)
    |> String.replace(old_word, new_word)
    |> (&Map.replace(item, :name, &1)).()
  end

  def increase_quantity(item, count) do
    item
    |> Map.get(:quantity_by_size)
    |> Enum.map(&increment_quantity(&1, count))
    |> Enum.into(%{})
    |> (&Map.replace(item, :quantity_by_size, &1)).()
  end

  defp increment_quantity({key, value}, count) do
    {key, value + count}
  end

  def total_quantity(item) do
    item
    |> Map.get(:quantity_by_size)
    |> Enum.reduce(0, &calculate_total/2)
  end

  defp calculate_total({_key, value}, acc), do: acc + value

end
