defmodule MyList do
  def split(list, split_on) when is_list(list) do
    do_split(list, split_on, [])
  end

  defp do_split([h | t], split_on, acc) do
    case h == split_on do
      true -> {Enum.reverse([h | acc]), t}
      false -> do_split(t, split_on, [h | acc])
    end
  end

  defp do_split([], _split_on, acc), do: {Enum.reverse(acc), []}
end
