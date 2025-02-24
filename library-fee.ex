# NOT READY

defmodule LibraryFees do

  @monday 1

  @before_noon_return 28
  @after_noon_return 29

  def datetime_from_string(string) do
    NaiveDateTime.from_iso8601!(string)
  end

  def before_noon?(datetime) do
    NaiveDateTime.to_time(datetime)
    |> Time.before?(~T[12:00:00])
  end

  def return_date(checkout_datetime) do
    case before_noon?(checkout_datetime) do
      :true -> Date.add(checkout_datetime, @before_noon_return)
      :false -> Date.add(checkout_datetime, @after_noon_return)
    end
  end

  def days_late(planned_return_date, actual_return_datetime) do
    NaiveDateTime.to_date(actual_return_datetime)
    |> calculate_difference(planned_return_date)
  end

  defp calculate_difference(planned_return_date, actual_return_date) do
    case Date.diff(planned_return_date, actual_return_date) do
      diff when diff <= 0 -> 0
      diff -> diff
    end
  end

  def monday?(datetime) do
    NaiveDateTime.to_date(datetime)
    |> Date.day_of_week == @monday
  end

  def calculate_late_fee(checkout, return, rate) do
    days_late(checkout, return)
    |> then( fn days -> days * rate * get_discount(checkout) end)
  end

  defp get_discount(return) do
    case monday?(return) do
      :true -> 0.5
      :false -> 1.0
    end
  end

end
