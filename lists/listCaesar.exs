defmodule MyList do
  def caesar([], _n), do: []

  def caesar([head | tail], n) when (head + n) > 90 or (head + n) > 122 do 
    new_char = (head + n) - 26
    [new_char | caesar(tail, n)]
  end
end
