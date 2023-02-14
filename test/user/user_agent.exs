defmodule Delivery.User.UserAgentTest do
  use ExUnit.Case

  alias Delivery.User.UserAgent
  import Delivery.Factory

  describe "save/1" do
    test "create a new user agent" do
      UserAgent.start_link(%{})

      user = build(:user)

      response = UserAgent.save(user)

      expected_response = :ok

      assert response == expected_response
    end
  end

  describe "get/1" do
    test "search a user through a cpf" do
      UserAgent.start_link(%{})

      user = build(:user, cpf: "8776765564")

      UserAgent.save(user)

      response = UserAgent.get("8776765564")

      expected_response =
        {:ok,
         %Delivery.User.User{
           address: "rua banana",
           age: 25,
           cpf: "8776765564",
           email: "henrique@gmail.com",
           name: "Henrique"
         }}

      assert response == expected_response
    end

    test "search a user through a invalid cpf" do
      UserAgent.start_link(%{})

      user = build(:user, cpf: "8776765564")

      UserAgent.save(user)

      response = UserAgent.get("75755745454")

      expected_response =
        {:error, "User not found"}

      assert response == expected_response
    end
  end
end
