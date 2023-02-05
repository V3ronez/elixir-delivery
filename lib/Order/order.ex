defmodule Delivery.Order.Order do
  @keys [:user_cpf, :delivery_address, :items, :quantity]
  @enforce_keys @keys
  defstruct @keys

  def build(user_cpf, delivery_address, items, quantity) do
    {:ok,
     %__MODULE__{
       user_cpf: user_cpf,
       delivery_address: delivery_address,
       items: items,
       quantity: quantity
     }}
  end

  # def build(_user_cpf, _delivery_address, _items, _quantity), do: {:error, "invalid parameters"}
end
