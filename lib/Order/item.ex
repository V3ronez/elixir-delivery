defmodule Delivery.Order.Item do
  @categories [:pizza, :hamburguer, :japonesa, :carne, :prato_feito, :sobremesa]
  @keys [:description, :category, :unity_price, :quantity]
  @enforce_keys @keys

  defstruct @keys

  def build(description, category, unity_price, quantity)
      when unity_price > 0 and quantity > 0 and category in @categories do
    {:ok,
     %__MODULE__{
       description: description,
       category: category,
       unity_price: unity_price,
       quantity: quantity
     }}
  end

  def build(_description, category, _unity_price, _quantity)
      when category not in @categories do
    {:error,
     "Please try again with a any this categories: pizza, hamburguer, japonesa, carne, prato_feito, sobremesa"}
  end

  def build(_description, _category, _unity_price, _quantity) do
    {:error, "Error to create a new item."}
  end
end
