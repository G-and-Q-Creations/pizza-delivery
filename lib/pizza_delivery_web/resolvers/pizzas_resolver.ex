defmodule PizzaDeliveryWeb.PizzaResolver do
  alias PizzaDelivery.Pizzas

  def all_pizzas(_root, _args, _info) do
    {:ok, Pizzas.list_pizza()}
  end
end
