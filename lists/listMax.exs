defmodule MyList do
  def maX([], max) do
    max
  end

  def maX([head | tail], max) when head > max do 
    maX(tail, head)
  end

  def maX([_head | tail], max) do 
    maX(tail, max)
  end

  def max([head | tail]) do 
    maX(tail, head)
  end
end
