defmodule PizzaDelivery.Restaurants.Restaurant do
  use Ecto.Schema
  import Ecto.Changeset

  schema "restaurants" do
    field :address, :string
    field :description, :string
    field :name, :string
    field :phone, :string
    field :slug, :string
    field :website, :string

    timestamps()
  end

  @doc false
  def changeset(restaurant, attrs) do
    restaurant
    |> cast(attrs, [:name, :slug, :description, :website, :phone, :address])
    |> validate_required([:name, :slug, :description])
  end
end
