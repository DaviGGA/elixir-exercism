defmodule PerfectNumbers do
  @doc """
  Determine the aliquot sum of the given `number`, by summing all the factors
  of `number`, aside from `number` itself.

  Based on this sum, classify the number as:

  :perfect if the aliquot sum is equal to `number`
  :abundant if the aliquot sum is greater than `number`
  :deficient if the aliquot sum is less than `number`
  """
  @spec classify(number :: integer) :: {:ok, atom} | {:error, String.t()}

  def classify(1), do: {:ok, :deficient}
  def classify(0), do: {:error, "Classification is only possible for natural numbers."}
  def classify(number) when number < 0, do: {:error, "Classification is only possible for natural numbers."}

  def classify(number) do
    case aliquot_sum(number) do
      sum when sum == number -> {:ok, :perfect}
      sum when sum > number -> {:ok, :abundant}
      sum when sum < number -> {:ok, :deficient}
    end
  end

  defp aliquot_sum(number) do
    Enum.reduce(1..number - 1, 0, fn divisor, acc ->  acc + sum(divisor, number) end)
  end

  defp sum(d, base) when rem(base, d) == 0, do: d
  defp sum(_d, _base), do: 0

end
