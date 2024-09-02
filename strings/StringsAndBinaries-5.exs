defmodule MyString do
  def center(list) do
    len = maxLen(list) |> getAverage

    Enum.each(list, fn word ->
      newLen = len - (String.length(word) |> getAverage)
      IO.puts("#{String.pad_leading(word, newLen + String.length(word))}")
    end)
  end

  defp getAverage(num) do
    ceil(num / 2)
  end

  defp maxLen(list) do
    Enum.reduce(list, 0, fn word, max ->
      if max <= String.length(word) do
        String.length(word)
      else
        max
      end
    end)
  end
end
