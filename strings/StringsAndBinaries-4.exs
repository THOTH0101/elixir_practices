defmodule Calculate do
  def expression(equation) do
    [numStr1, opStr, numStr2] = List.to_string(equation) |> String.split(" ")

    {num1, _} = Float.parse(numStr1)
    {num2, _} = Float.parse(numStr2)

    case opStr do
      "+" -> num1 + num2
      "-" -> num1 - num2
      "*" -> num1 * num2
      "/" -> num1 / num2
    end
  end
end
