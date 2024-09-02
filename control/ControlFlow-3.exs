defmodule Ok do
  def !(param) do
    case param do
      {:ok, data}->
        data
      {_, error}->
        raise "Failed! because #{error}"
    end
  end
end
