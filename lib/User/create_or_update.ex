defmodule Delivery.User.CreateOrUpdate do
  alias Delivery.User.User
  alias Delivery.User.UserAgent, as: UserAgent

  def call(%{name: name, email: email, cpf: cpf, address: address, age: age}) do
    name
    |> User.build(email, cpf, address, age)
    |> save_user()
  end

  defp save_user({:ok, %User{} = user}), do: UserAgent.save(user)
  defp save_user({:error, _reason}), do: {:error, "User invalid to create a agent"}
end
