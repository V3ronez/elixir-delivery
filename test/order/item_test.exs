defmodule Delivery.Order.ItemTest do
  alias Delivery.Order.Item

  use ExUnit.Case
  import Delivery.Factory

  describe "build/4" do
    test "create a new item" do
      response = Item.build("pizza de chocolate", :pizza, Decimal.new("29.90"), 3)

      expected_response = {:ok, build(:item)}

      assert response == expected_response
    end

    test "input invalid parameters to create a new item" do
      response = Item.build("pizza de chocolate", :pizza, "banana", 3)

      expected_response = {:error, "Invalid price!"}

      assert response == expected_response
    end
  end
end
