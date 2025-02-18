defmodule LanguageList do

  @spec new() :: list(String.t())
  def new() do
    []
  end

  @spec add(list(String.t()), String.t()) :: list(String.t())
  def add(list, language) do
    [language | list]
  end

  def remove(list) do
    [_ | tail] = list
    tail
  end

  def first(list) do
    [first | _] = list
    first
  end

  def count(list) do
    length(list)
  end

  def functional_list?(list) do
    "Elixir" in list
  end
end
