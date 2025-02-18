defmodule Secrets do


  @spec secret_add(integer) :: (integer, integer -> integer)
  def secret_add(secret) do
    &(&1 + secret)
  end

  @spec secret_subtract(integer) :: (integer, integer -> integer)
  def secret_subtract(secret) do
    &(&1 - secret)
  end

  @spec secret_multiply(integer) :: (integer, integer -> integer)
  def secret_multiply(secret) do
    &(&1 * secret)
  end


  def secret_divide(secret) do
    &(&1 / secret) |> trunc
  end

  def secret_and(secret) do
    &Bitwise.band(&1, secret)
  end

  def secret_xor(secret) do
    &Bitwise.bxor(&1, secret)
  end

  def secret_combine(secret_function1, secret_function2) do
    &(&1 |> secret_function1.() |> secret_function2.())
  end
end
