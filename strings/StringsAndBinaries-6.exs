defmodule MyString do
  def capitalize_sentences(str), do: _capitalise(str, "")

  defp _capitalise(<<>>, acc), do: acc

  defp _capitalise(<<head::utf8, tail::binary>>, acc) do
    if <<head>> === " " && String.ends_with?(acc, ".") do
      _is_terminal(tail, acc <> <<head>>)
    else
      _capitalise(tail, acc <> String.downcase(<<head>>))
    end
  end

  defp _is_terminal(<<>>, acc), do: acc

  defp _is_terminal(<<head::utf8, tail::binary>>, acc) do
    _capitalise(tail, acc <> String.upcase(<<head>>))
  end
end
