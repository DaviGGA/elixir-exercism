defmodule HighScore do
  def new() do
    %{}
  end

  def add_player(scores, name, score \\ 0)

  def add_player(scores, name, score) do
    Map.put_new(scores, name, score)
  end
#
  def remove_player(scores, name) do
    {_, removed} = Map.pop(scores, name)
    removed
  end

  def reset_score(scores, name) do
    case Map.has_key?(scores, name) do
      true -> Map.replace(scores, name, 0)
      false -> add_player(scores, name)
    end
  end

  def update_score(scores, name, score) do
    Map.update(scores, name, score, fn val -> val + score end)
  end

  def get_players(scores) do
    Map.keys(scores)
  end
end
