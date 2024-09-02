defmodule MyString do
  def printable?([]), do: true
  def printable?([h | t]) do
    if h > 31 && h < 127 do
      printable?(t)
    else
      false
    end
  end
end
