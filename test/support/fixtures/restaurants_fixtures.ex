defmodule PizzaDelivery.RestaurantsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PizzaDelivery.Restaurants` context.
  """

  @doc """
  Generate a restaurant.
  """
  def restaurant_fixture(attrs \\ %{}) do
    {:ok, restaurant} =
      attrs
      |> Enum.into(%{
        description: "some description",
        name: "some name",
        phone: "some phone",
        slug: "some slug",
        website: "some website",
        address: "some address"
      })
      |> PizzaDelivery.Restaurants.create_restaurant()

    restaurant
  end
end
