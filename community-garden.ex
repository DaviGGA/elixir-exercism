# Use the Plot struct as it is provided
defmodule Plot do
  @enforce_keys [:plot_id, :registered_to]
  defstruct [:plot_id, :registered_to]
end

defmodule CommunityGarden do

  def start(opts \\ []), do: Agent.start(fn -> %{plots: [], id_count: 0} end, opts)

  def list_registrations(pid) do
    Agent.get(pid, fn %{plots: plots} -> plots end)
  end

  def register(pid, register_to) do
    Agent.get_and_update(pid, fn %{plots: plots, id_count: id_count} ->
      new_plot = %Plot{plot_id: id_count + 1, registered_to: register_to}
      new_state = %{plots: [new_plot | plots], id_count: id_count + 1}
      {new_plot, new_state}
    end)
  end

  def release(pid, plot_id) do
    Agent.get_and_update(pid, fn state ->
      new_state = %{
        state | plots: Enum.filter(state[:plots],
        fn plot -> plot.plot_id != plot_id end)
      }

      {:ok, new_state}
    end)
  end

  def get_registration(pid, plot_id) do
    Agent.get(pid, fn %{plots: plots} -> plots end)
    |> Enum.find(fn %Plot{plot_id: id} -> id == plot_id end)
    |> plot_or_not_found
  end

  defp plot_or_not_found(nil), do: {:not_found, "plot is unregistered"}
  defp plot_or_not_found(plot), do: plot

end
