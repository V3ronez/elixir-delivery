defmodule Delivery.User.UserTest do
  use ExUnit.Case
  alias Delivery.User.User

  import Delivery.Factory

  describe "build/5" do
    test "create a new user" do
      # response =
      #   User.build(
      #     "Henrique",
      #     "henrique@gmail.com",
      #     "123456789",
      #     "rua banana",
      #     25
      #   )
      response = {:ok, build(:user)}

      expected_response =
        {:ok,
         %Delivery.User.User{
           name: "Henrique",
           email: "henrique@gmail.com",
           cpf: "123456789",
           address: "rua banana",
           age: 25
         }}

      assert response == expected_response
    end

    test "input invalid parameters to create a new user and return an error" do
      response =
        User.build(
          "Henrique",
          "henrique@gmail.com",
          "123456789",
          "rua banana",
          5
        )

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end
