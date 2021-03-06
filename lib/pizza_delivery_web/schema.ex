defmodule PizzaDeliveryWeb.Schema do
  use Absinthe.Schema

  alias PizzaDeliveryWeb.RestaurantsResolver
  alias PizzaDeliveryWeb.PizzaResolver

  object :restaurant do
    field :id, non_null(:id)
    field :name, non_null(:string)
    field :slug, non_null(:string)
    field :description, non_null(:string)
    field :address, :string
    field :website, :string
    field :phone, :string
    field :pizzas, list_of(:pizza) do
      resolve &PizzaResolver.list_pizzas/3
    end
  end

  object :pizza do
    field :id, non_null(:id)
    field :name, non_null(:string)
    field :price_usd, non_null(:float)
    field :image, :string
    field :restaurant, non_null(:restaurant)
  end

  query do
    @desc "Get all restaurants"
    field :all_restaurants, non_null(list_of(non_null(:restaurant))) do
      resolve(&RestaurantsResolver.all_restaurants/3)
    end

    @desc "Get all pizzas"
    field :all_pizzas, non_null(list_of(non_null(:pizza))) do
      resolve(&PizzaResolver.all_pizzas/3)
    end
  end
end
