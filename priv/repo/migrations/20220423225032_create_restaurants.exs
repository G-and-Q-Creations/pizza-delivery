defmodule PizzaDelivery.Repo.Migrations.CreateRestaurants do
  use Ecto.Migration

  def change do
    create table(:restaurants) do
      add :name, :string
      add :slug, :string
      add :description, :string
      add :website, :string
      add :phone, :string
      add :address, :string

      timestamps()
    end
  end
end
