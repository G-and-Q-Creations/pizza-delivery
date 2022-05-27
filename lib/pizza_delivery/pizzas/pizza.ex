defmodule PizzaDelivery.Pizzas.Pizza do
  use Ecto.Schema
  import Ecto.Changeset

  schema "pizzas" do
    field :diameter_inches, :float
    field :image, :string
    field :name, :string
    field :price_usd, :float
    field :restaurant_id, :id

    timestamps()
  end

  @doc false
  def changeset(pizza, attrs) do
    pizza
    |> cast(attrs, [:name, :diameter_inches, :price_usd, :image])
    |> validate_required([:name, :diameter_inches, :price_usd, :image])
  end
end
