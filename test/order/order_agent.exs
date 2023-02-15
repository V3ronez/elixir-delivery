defmodule Delivery.Order.OrderAgentTest do
  use ExUnit.Case

  alias Delivery.Order.OrderAgent
  import Delivery.Factory

  describe "save/1" do
    test "create a new order agent" do
      OrderAgent.start_link(%{})
      order = build(:order)
      assert {:ok, _uuid} = OrderAgent.save(order)
    end
  end

  describe "get/1" do
    setup do
      :ok
    end

    test "search a order through an uuid" do
      OrderAgent.start_link(%{})

      {:ok, uuid} =
        :order
        |> build()
        |> OrderAgent.save()

      response = OrderAgent.get(uuid)

      expected_response =
        {:ok,
         %Delivery.Order.Order{
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
         }}

      assert response == expected_response
    end
  end

  #   test "search a user through a invalid cpf" do
  #     UserAgent.start_link(%{})

  #     user = build(:user, cpf: "8776765564")

  #     UserAgent.save(user)

  #     response = UserAgent.get("75755745454")

  #     expected_response = {:error, "User not found"}

  #     assert response == expected_response
  #   end
  # end
end
