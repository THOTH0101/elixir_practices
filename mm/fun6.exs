defmodule Chop do
  def guess(g, m, l, _h) when g < m do
    guess(g, l, m)
  end

  def guess(g, m, _l, h) when g > m do
    guess(g, m, h)
  end

  def guess(g, m, _l, _h) when g === m do
    g
  end

  def guess(g, l, h) when l === 1 do
    mid = div(h, 2)

    IO.puts "Is it #{mid}"
    guess(g, mid, l, h)
  end

  def guess(g, l, h) do
    dif = h - l
    mid = div(dif,2)
    new = l + mid

    IO.puts "Is it #{new}"
    guess(g, new, l, h)
  end

  def guess(g, l..h), do: guess(g, l, h)
end
