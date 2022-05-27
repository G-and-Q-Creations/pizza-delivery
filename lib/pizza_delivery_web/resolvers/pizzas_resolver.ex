defmodule PizzaDeliveryWeb.PizzaResolver do
  alias PizzaDelivery.Pizzas

  def list_pizzas(%PizzaDelivery.Restaurants.Restaurant{} = restaurant, _args, _info) do
    {:ok, Pizzas.list_pizza(restaurant)}
  end

  def all_pizzas(_root, _args, _info) do
    {:ok, Pizzas.list_pizza()}
  end
end
