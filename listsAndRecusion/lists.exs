defmodule MyEnum do
  def all?([], _func) do
    true
  end

  def all?([head | tail], func) do
    if !func.(head) do
      false
    else
      all?(tail, func)
    end
  end

  def filter([], _func), do: []

  def filter([head | tail], func) do
    if func.(head), do: [head | filter(tail, func)],
    else: filter(tail, func)
  end

  def take(list, len), do: take(list, len, [], 0)
  def take([], _len, acc, _count), do: Enum.reverse(acc)
  def take([head | tail], len, acc, count) do 
    if count === len do 
      Enum.reverse(acc)
    else
      take(tail, len, [head | acc], count + 1)
    end
  end

  def split(list, len), do: split(list, len, [], 0)
  def split([], _len, acc, _count), do: {Enum.reverse(acc), []}
  def split([head | tail], len, acc, count) do
    count = count + 1
    if count === len do 
      {Enum.reverse([head | acc]), tail}
    else
      split(tail, len, [head | acc], count)
    end
  end
end
