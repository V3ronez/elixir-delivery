defmodule Delivery do
  alias Delivery.Order
  alias Delivery.Order.CreateOrUpdate, as: CreateOrUpdateOrder
  alias Delivery.User.CreateOrUpdate, as: CreateOrUpdateUser
  alias Delivery.User.UserAgent

  def start_agents() do
    Order.OrderAgent.start_link(%{})
    UserAgent.start_link(%{})
  end

  defdelegate create_or_update_user(params), to: CreateOrUpdateUser, as: :call
  defdelegate create_or_update_order(params), to: CreateOrUpdateOrder, as: :call
end
