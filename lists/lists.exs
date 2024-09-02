defmodule MyList do
  def mapsum([], value, _) do
    value
  end

  def mapsum([head | tail], value, func) do
    mapsum(tail, value + func.(head), func)
  end

  def mapsum([head | tail], func) do
    mapsum([head | tail], 0, func)
  end
end
