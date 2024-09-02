defmodule MyEnum do
  def apply_tax(tax_rates, order) do
    tax = Keyword.get(tax_rates, order[:ship_to], 0)
    Keyword.put(order, :total_amount, order[:net_amount] + order[:net_amount] * tax)
  end
end
