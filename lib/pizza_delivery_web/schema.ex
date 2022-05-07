defmodule PizzaDeliveryWeb.Schema do
  use Absinthe.Schema

  alias PizzaDeliveryWeb.RestaurantsResolver

  object :restaurant do
    field :id, non_null(:id)
    field :name, non_null(:string)
    field :slug, non_null(:string)
    field :description, non_null(:string)
    field :address, :string
    field :website, :string
    field :phone, :string
  end

  query do
    @desc "Get all restaurants"
    field :all_restaurants, non_null(list_of(non_null(:restaurant))) do
      resolve(&RestaurantsResolver.all_restaurants/3)
    end
  end
end
