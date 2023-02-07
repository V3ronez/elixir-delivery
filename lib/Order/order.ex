defmodule Delivery.Order.Order do
  alias Delivery.Order.Item
  alias Delivery.User.User

  @keys [:user_cpf, :delivery_address, :items, :total_price]
  @enforce_keys @keys
  defstruct @keys

  def build(%User{cpf: cpf, address: address}, [%Item{} | _item] = items) do
    # if second parameter is != %Item will crash de application, fix this before
    {:ok,
     %__MODULE__{
       user_cpf: cpf,
       delivery_address: address,
       items: items,
       total_price: calculate_total(items)
     }}
  end

  def build(_user, _items), do: {:error, "invalid parameters"}

  defp calculate_total(items) do
    Enum.reduce(items, Decimal.new("0.00"), &sum_prices_item(&1, &2))
  end

  defp sum_prices_item(%Item{unity_price: price, quantity: quantity}, accumulator) do
    price
    |> Decimal.mult(quantity)
    |> Decimal.add(accumulator)
  end
end
