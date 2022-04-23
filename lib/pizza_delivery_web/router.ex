defmodule PizzaDeliveryWeb.Router do
  use PizzaDeliveryWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :api

    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: PizzaDeliveryWeb.Schema,
      interface: :simple,
      context: %{pubsub: PizzaDeliveryWeb.Endpoint}
  end
end
