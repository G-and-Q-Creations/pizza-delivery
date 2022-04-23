defmodule PizzaDelivery.Repo do
  use Ecto.Repo,
    otp_app: :pizza_delivery,
    adapter: Ecto.Adapters.Postgres
end
