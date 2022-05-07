defmodule PizzaDelivery.Repo.Migrations.CreatePizzas do
  use Ecto.Migration

  def change do
    create table(:pizzas) do
      add :name, :string
      add :diameter_inches, :float
      add :price_usd, :float
      add :image, :string
      add :restaurant_id, references(:restaurants, on_delete: :nothing)

      timestamps()
    end

    create index(:pizzas, [:restaurant_id])
  end
end
