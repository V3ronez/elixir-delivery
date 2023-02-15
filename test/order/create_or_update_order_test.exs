defmodule Delivery.Order.CreateOrUpdateTest do
  use ExUnit.Case

  import Delivery.Factory

  alias Delivery.Order.CreateOrUpdate, as: CreateOrUpdateOrder
  alias Delivery.User.UserAgent

  describe "call/1" do
    setup do
      Delivery.start_agents()

      cpf = "1234567899"
      user = build(:user, cpf: cpf)
      UserAgent.save(user)

      item1 = %{
        description: "pizza de chocolate",
        category: :pizza,
        unity_price: "23.00",
        quantity: 3
      }

      item2 = %{
        description: "comida japonesa",
        category: :japonesa,
        unity_price: "50",
        quantity: 2
      }

      {:ok, user_cpf: cpf, item1: item1, item2: item2}
    end

    test "when all params is valid, saves the order", %{user_cpf: cpf, item1: item1, item2: item2} do
      params = %{user_cpf: cpf, items: [item1, item2]}
      assert {:ok, _uuid} = CreateOrUpdateOrder.call(params)
    end

    test "fail when gives a invalid cpf", %{item1: item1, item2: item2} do
      params = %{user_cpf: "00000343", items: [item1, item2]}
      assert {:error, "User not found"} = CreateOrUpdateOrder.call(params)
    end

    test "fail when gives a invalid parameter", %{user_cpf: cpf, item1: item1, item2: item2} do
      item2 = %{
        description: "comida japonesa",
        category: :japonesa,
        unity_price: "invalid",
        quantity: 0
      }

      params = %{user_cpf: cpf, items: [item1, item2]}
      # params = %{user_cpf: cpf, items: [item1, %{item2 | quantity: 0}]}
      assert {:error, "Invalid Items"} == CreateOrUpdateOrder.call(params)
    end
  end
end
