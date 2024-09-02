defmodule FizzBuzz do
  def upto(n) when n > 0, do: 1..n |> Enum.map(&fizzbuzz/1)

  defp fizzbuzz(n), do: fizzword(n, rem(n, 3), rem(n, 5))

  defp fizzword(n, fizz, buzz) do
    case {n, fizz, buzz} do
      {_n, 0, 0} ->
        "FizzBuzz"

      {_n, 0, _} ->
        "Fizz"

      {_n, _, 0} ->
        "Buzz"

      {n, _, _} ->
        n
    end
  end
end
