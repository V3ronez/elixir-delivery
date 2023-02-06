defmodule Delivery.User.User do
  @keys [:name, :email, :cpf, :address, :age]
  @enforce_keys @keys
  defstruct @keys

  def build(name, email, cpf, address, age) when age >= 18 and is_bitstring(cpf) do
    {:ok,
     %__MODULE__{
       name: name,
       email: email,
       cpf: cpf,
       address: address,
       age: age
     }}
  end

  def build(_name, _email, _cpf, _address, _age), do: {:error, "Invalid parameters"}
end
