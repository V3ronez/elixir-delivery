defmodule Delivery.Factory do
  use ExMachina
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
end
