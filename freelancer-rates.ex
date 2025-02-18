defmodule FreelancerRates do

  @billable_days_in_month 22
  @hour_to_daily_rate 8.0

  @spec daily_rate(integer) :: float
  def daily_rate(hourly_rate) do
    hourly_rate * @hour_to_daily_rate
  end

  @spec apply_discount(integer, integer) :: float
  def apply_discount(before_discount, discount) do
    before_discount * (1 - discount / 100)
  end

  @spec monthly_rate(integer, float) :: integer
  def monthly_rate(hourly_rate, discount) do
    daily_rate(hourly_rate) * @billable_days_in_month
    |> (&apply_discount(&1, discount)).()
    |> Float.ceil
    |> trunc
  end

  def days_in_budget(budget, hourly_rate, discount) do
    (budget + budget - apply_discount(budget, discount)) / daily_rate(hourly_rate)
    |> precise_floor_to_1
  end

  defp precise_floor_to_1(value) do
    value * 10
    |> Float.floor()
    |> Kernel./(10)
  end
end
