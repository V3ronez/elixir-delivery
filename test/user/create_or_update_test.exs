defmodule Delivery.User.CreateOrUpdateTest do
  use ExUnit.Case

  alias Delivery.User.CreateOrUpdate, as: CreateOrUpdateUser
  alias Delivery.User.UserAgent

  describe "call/1" do
    setup do
      UserAgent.start_link(%{})

      user = %{
        name: "Henrique",
        email: "henrique@gmail.com",
        cpf: "123456789",
        address: "rua banana",
        age: 25
      }

      {:ok, user: user}
    end

    test "save new user in an agent", %{user: user} do
      response = CreateOrUpdateUser.call(user)

      expected_response = :ok

      assert response == expected_response
    end

    test "update a before created user", %{user: user} do
      %{user | name: "isabella"}
      |> CreateOrUpdateUser.call()

      response = UserAgent.get("123456789")

      expected_response =
        {:ok,
         %Delivery.User.User{
           name: "isabella",
           email: "henrique@gmail.com",
           cpf: "123456789",
           address: "rua banana",
           age: 25
         }}

      assert response == expected_response
    end

    test "try update a user with invalid params", %{user: user} do
      %{user | age: 10}
      |> CreateOrUpdateUser.call()

      response = UserAgent.get("123456789")

      expected_response = {:error, "User not found"}

      assert response == expected_response
    end
  end
end
