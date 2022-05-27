# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     PizzaDelivery.Repo.insert!(%PizzaDelivery.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias PizzaDelivery.Restaurants.Restaurant
alias PizzaDelivery.Pizzas.Pizza
alias PizzaDelivery.Repo

restaurant = %Restaurant{
  name: "Lupo Fremont",
  slug: "lupo-fremont",
  description: "Cozy, anique-decorated Italian eatery serving pasta dishes, antipasto & Neapolitan-style pizza.",
  address: "4303 Fremont Ave N, Seattle, WA, 98103",
  website: "https://www.lupofremont.com",
  phone: "2065472144"
} |> Repo.insert!

_pizza = %Pizza{
  name: "Uncle Don's",
  diameter_inches: 14.0,
  price_usd: 22.0,
  restaurant_id: restaurant.id
} |> Repo.insert!
