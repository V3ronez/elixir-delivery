defmodule Delivery.Factory do
  use ExMachina
  alias Delivery.Order.{Item, Order}
  alias Delivery.User.User

  def user_factory do
    %User{
      name: "Henrique",
      email: "henrique@gmail.com",
      cpf: "123456789",
      address: "rua banana",
      age: 25
    }
  end

  def item_factory do
    %Item{
      description: "pizza de chocolate",
      category: :pizza,
      unity_price: Decimal.new("29.90"),
      quantity: 3
    }
  end

  def order_factory do
    %Order{
      user_cpf: "123456789",
      delivery_address: "rua banana",
      items: [
        %Delivery.Order.Item{
          description: "pizza de chocolate",
          category: :pizza,
          unity_price: Decimal.new("29.90"),
          quantity: 3
        },
        %Delivery.Order.Item{
          description: "sushi",
          category: :japonesa,
          unity_price: Decimal.new("40.30"),
          quantity: 4
        }
      ],
      total_price: Decimal.new("250.90")
    }
  end
end
