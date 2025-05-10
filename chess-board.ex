defmodule Chessboard do
  def rank_range do
    1..8
  end

  def file_range do
    65..72
  end

  def ranks do
    Enum.to_list(rank_range())
  end

  def files do
    file_range()
    |> Enum.map(&<<&1>>)
  end
end
