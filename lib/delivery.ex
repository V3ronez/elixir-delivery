defmodule Delivery do
  alias Delivery.User.CreateOrUpdate
  alias Delivery.User.UserAgent

  def start_links(), do: UserAgent.start_link(%{})
  defdelegate create_or_update(params), to: CreateOrUpdate, as: :call
end
