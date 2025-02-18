defmodule BirdCount do

  def today([]), do: :nil
  def today([head | _tail]), do: head

  def increment_day_count([]), do: [1]
  def increment_day_count([head | tail]), do: [head + 1 | tail]

  def has_day_without_birds?([]), do: false
  def has_day_without_birds?([0 | _tail]), do: true
  def has_day_without_birds?([_head | tail]), do: has_day_without_birds?(tail)


  def total([]), do: 0
  def total([head | tail]), do: head + total(tail)


  def busy_days([]), do: 0
  def busy_days([head | tail]) do
    case busy_day?(head) do
      true -> 1 + busy_days(tail)
      false -> busy_days(tail)
    end
  end

  defp busy_day?(day_visits), do: day_visits >= 5
end
