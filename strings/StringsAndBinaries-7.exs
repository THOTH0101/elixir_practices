defmodule ToKeyword do
  def list(file) do
    input = File.open!(file)
    [_head | lines] = Enum.map(IO.stream(input, :line), &String.trim(&1))
    Enum.map(lines, &parse_order(&1))
  end

  defp parse_order(lines) do
    [id_string, ship_to_string, net_amount_string] = String.split(lines, ",")

    {id, _} = Integer.parse(id_string)
    ship_to = String.replace(ship_to_string, ":", "") |> String.to_atom()
    {net_amount, _} = Float.parse(net_amount_string)
    Keyword.new([{:id, id}, {:ship_to, ship_to}, {:net_amount, net_amount}])
  end
end
