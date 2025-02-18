defmodule HighSchoolSweetheart do
  def first_letter(name) do
    String.trim(name) |> String.first()
  end

  def initial(name) do
    String.first(name)
    |> String.upcase()
    |> Kernel.<>(".")
  end

  def initials(full_name) do
    [first_name, last_name] = String.split(full_name)
    initial(first_name) <> " " <> initial(last_name)
  end

  def pair(full_name1, full_name2) do
    in1 = initials(full_name1)
    in2= initials(full_name2)

    """
         ******       ******
       **      **   **      **
     **         ** **         **
    **            *            **
    **                         **
    **     #{in1}  +  #{in2}     **
     **                       **
       **                   **
         **               **
           **           **
             **       **
               **   **
                 ***
                  *
    """
  end
end
