defmodule Username do

  def sanitize([]), do: ~c""

  def sanitize([head | tail]) do
    character = case head do
      ?ä	-> ~c"ae"
      ?ö -> ~c"oe"
      ?ü	-> ~c"ue"
      ?ß	-> ~c"ss"
      head when (head >= ?a and head <= ?z) or head == ?_ -> [head]
      _ -> ~c""
    end

    character ++ sanitize(tail)
  end

end
