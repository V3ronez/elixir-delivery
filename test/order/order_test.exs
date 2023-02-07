defmodule Delivery.Order.OrderTest do
  alias Delivery.Order.Order

  use ExUnit.Case
  import Delivery.Factory

  describe "build/2" do
    test "create a new order" do
      user = build(:user)

      items = [
        build(:item),
        build(:item,
          description: "sushi",
          category: :japonesa,
          unity_price: Decimal.new("40.30"),
          quantity: 4
        )
      ]

      response = Order.build(user, items)

      expected_response = {:ok, build(:order)}

      assert response == expected_response
    end

    test "input invalid parameters to order" do
      user = build(:user)

      items = []

      response = Order.build(user, items)

      expected_response = {:error, "invalid parameters"}

      assert response == expected_response
    end
  end
end
