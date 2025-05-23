defmodule RemoteControlCar do

  @enforce_keys [:nickname]
  defstruct [
    :nickname,
    battery_percentage: 100,
    distance_driven_in_meters: 0
  ]

  def new(nickname \\ "none") do
    %RemoteControlCar{
      nickname: nickname,
      battery_percentage: 100,
      distance_driven_in_meters: 0,
   }
  end

  def display_distance(%RemoteControlCar{distance_driven_in_meters: distance}) do
    Integer.to_string(distance) <> " meters"
  end

  def display_battery(%RemoteControlCar{battery_percentage: 0}), do: "Battery empty"
  def display_battery(%RemoteControlCar{battery_percentage: battery}) do
    "Battery at " <> Integer.to_string((battery)) <> "%"
  end


  def drive(%RemoteControlCar{battery_percentage: 0} = remote_car), do: remote_car
  def drive(%RemoteControlCar{} = remote_car) do
    %{
      remote_car |
      battery_percentage: remote_car.battery_percentage - 1,
      distance_driven_in_meters: remote_car.distance_driven_in_meters + 20
    }
  end
end
