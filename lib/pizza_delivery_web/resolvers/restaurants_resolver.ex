defmodule PizzaDeliveryWeb.RestaurantsResolver do
  alias PizzaDelivery.Restaurants

  def all_restaurants(_root, _args, _info) do
    {:ok, Restaurants.list_restaurants()}
  end
end
