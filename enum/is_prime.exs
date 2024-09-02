defmodule IsPrime do
  def number(n), do: number(n, 2)
  def number(n, i) when i === n, do: true

  def number(n, i) do
    if rem(n, i) === 0 do
      false
    else
      number(n, i + 1)
    end
  end
end
