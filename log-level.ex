defmodule LogLevel do

  def to_label(level, legacy?) do
    cond do
      (level == 0) and not legacy? -> :trace
      level == 1 -> :debug
      level == 2 -> :info
      level == 3 -> :warning
      level == 4 -> :error
      (level == 5) and not legacy? -> :fatal
      true -> :unknown
    end
  end

  def alert_recipient(level, legacy?) do
    case {to_label(level, legacy?), legacy?} do
      {:fatal, _} -> :ops
      {:error, _} -> :ops
      {:unknown, true} -> :dev1
      {:unknown, false} -> :dev2
      {_, _} -> false
    end
  end

end
