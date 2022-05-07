defmodule PizzaDelivery.PizzasFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PizzaDelivery.Pizzas` context.
  """

  @doc """
  Generate a pizza.
  """
  def pizza_fixture(attrs \\ %{}) do
    {:ok, pizza} =
      attrs
      |> Enum.into(%{
        diameter_inches: 120.5,
        image: "some image",
        name: "some name",
        price_usd: 120.5
      })
      |> PizzaDelivery.Pizzas.create_pizza()

    pizza
  end
end
