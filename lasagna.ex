defmodule Lasagna do
  # Please define the 'expected_minutes_in_oven/0' function

  # Please define the 'remaining_minutes_in_oven/1' function

  # Please define the 'preparation_time_in_minutes/1' function

  # Please define the 'total_time_in_minutes/2' function

  # Please define the 'alarm/0' function

  @preparation_time 2

  @spec expected_minutes_in_oven :: integer
  def expected_minutes_in_oven do
    40
  end

  @spec remaining_minutes_in_oven(integer) :: integer
  def remaining_minutes_in_oven(min) do
    Lasagna.expected_minutes_in_oven() - min
  end

  @spec preparation_time_in_minutes(integer) :: integer
  def preparation_time_in_minutes(layers) do
    @preparation_time * layers
  end

  @spec total_time_in_minutes(integer, integer) :: integer
  def total_time_in_minutes(layers, time_spent) do
    Lasagna.preparation_time_in_minutes(layers) + time_spent
  end

  def alarm() do
    "Ding!"
  end

end
