defmodule MyList do
  def flatten(list), do: flatten(list, [])

  def flatten([], acc), do: Enum.reverse(acc)
  def flatten([head | tail], acc) when not is_list(head), do: flatten(tail, [head | acc])
  def flatten([head | tail], acc) when is_list(head), do: flatten(head ++ tail, acc)
end
