defmodule PizzaDeliveryWeb.HealthCheckController do
  use PizzaDeliveryWeb, :controller

  def index(conn, _params) do
    text conn, "You are pizza!"
  end
end
