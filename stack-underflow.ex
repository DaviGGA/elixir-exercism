defmodule RPNCalculator.Exception do

  defmodule DivisionByZeroError do
    defexception message: "division by zero occurred"
  end

  defmodule StackUnderflowError do
    defexception message: "stack underflow occurred"

    @impl true
    def exception(value) when is_binary(value) do
      %StackUnderflowError{
        message: "stack underflow occurred, context: " <> value
      }
    end

    @impl true
    def exception([context: value]) do
      %StackUnderflowError{
        message: "stack underflow occurred, context: #{value}"
      }
    end

    @impl true
    def exception(_), do: %StackUnderflowError{}
  end

  def divide([]) do
    raise StackUnderflowError, "when dividing"
  end
  def divide([_a]) do
    raise StackUnderflowError, "when dividing"
  end
  def divide([0, _n]), do: raise DivisionByZeroError
  def divide([a, b]), do: b / a

end
