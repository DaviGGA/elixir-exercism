defmodule NameBadge do
  def print(id, name, department) do

    department_uppercase = if(department, do: String.upcase(department), else: "OWNER")

    if id do
      "[#{id}] - #{name} - #{department_uppercase}"
    else
      "#{name} - #{department_uppercase}"
    end
  end
end
