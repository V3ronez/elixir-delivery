defmodule Delivery.Order.Report do
  alias Delivery.Order.Item
  alias Delivery.Order.Order
  alias Delivery.Order.OrderAgent

  def create(filename \\ "default_name.csv") do
    orders = build_order_report()
    File.write(filename, orders)
  end

  defp build_order_report() do
    OrderAgent.list_orders()
    |> Map.values()
    |> Enum.map(fn order -> order_string(order) end)
  end

  defp order_string(%Order{user_cpf: cpf, items: items, total_price: total_price}) do
    item_list = Enum.map(items, fn item -> build_item(item) end)
    "#{cpf}#{item_list},#{total_price}\n"
  end

  defp build_item(%Item{description: description, category: category, quantity: quantity}) do
    ",#{description},#{category},#{quantity}"
  end
end
