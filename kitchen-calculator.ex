defmodule KitchenCalculator do
  def get_volume(volume_pair) do
    elem(volume_pair, 1)
  end

  def to_milliliter({:milliliter, value}) do
    {:milliliter, value}
  end

  def to_milliliter({:cup, value}) do
    {:milliliter, value * 240}
  end

  def to_milliliter({:fluid_ounce, value}) do
    {:milliliter, value * 30}
  end

  def to_milliliter({:teaspoon, value}) do
    {:milliliter, value * 5}
  end

  def to_milliliter({:tablespoon, value}) do
    {:milliliter, value * 15}
  end

  def from_milliliter({:milliliter, value}, :cup), do: {:cup, value / 240}

  def from_milliliter({:milliliter, value}, :fluid_ounce), do: {:fluid_ounce, value / 30}

  def from_milliliter({:milliliter, value}, :teaspoon), do: {:teaspoon, value / 5}

  def from_milliliter({:milliliter, value}, :tablespoon), do: {:tablespoon, value / 15}

  def from_milliliter({:milliliter, value}, :milliliter), do: {:milliliter, value}

  def convert({from_unit, value}, to_unit) do
    to_milliliter({from_unit, value})
    |> get_volume()
    |> (&from_milliliter({:milliliter, &1}, to_unit)).()
  end
end
