defmodule PizzaDelivery.PizzasTest do
  use PizzaDelivery.DataCase

  alias PizzaDelivery.Pizzas

  describe "pizza" do
    alias PizzaDelivery.Pizzas.Pizza

    import PizzaDelivery.PizzasFixtures

    @invalid_attrs %{diameter_inches: nil, image: nil, name: nil, price_usd: nil}

    test "list_pizza/0 returns all pizza" do
      pizza = pizza_fixture()
      assert Pizzas.list_pizza() == [pizza]
    end

    test "get_pizza!/1 returns the pizza with given id" do
      pizza = pizza_fixture()
      assert Pizzas.get_pizza!(pizza.id) == pizza
    end

    test "create_pizza/1 with valid data creates a pizza" do
      valid_attrs = %{diameter_inches: 120.5, image: "some image", name: "some name", price_usd: 120.5}

      assert {:ok, %Pizza{} = pizza} = Pizzas.create_pizza(valid_attrs)
      assert pizza.diameter_inches == 120.5
      assert pizza.image == "some image"
      assert pizza.name == "some name"
      assert pizza.price_usd == 120.5
    end

    test "create_pizza/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Pizzas.create_pizza(@invalid_attrs)
    end

    test "update_pizza/2 with valid data updates the pizza" do
      pizza = pizza_fixture()
      update_attrs = %{diameter_inches: 456.7, image: "some updated image", name: "some updated name", price_usd: 456.7}

      assert {:ok, %Pizza{} = pizza} = Pizzas.update_pizza(pizza, update_attrs)
      assert pizza.diameter_inches == 456.7
      assert pizza.image == "some updated image"
      assert pizza.name == "some updated name"
      assert pizza.price_usd == 456.7
    end

    test "update_pizza/2 with invalid data returns error changeset" do
      pizza = pizza_fixture()
      assert {:error, %Ecto.Changeset{}} = Pizzas.update_pizza(pizza, @invalid_attrs)
      assert pizza == Pizzas.get_pizza!(pizza.id)
    end

    test "delete_pizza/1 deletes the pizza" do
      pizza = pizza_fixture()
      assert {:ok, %Pizza{}} = Pizzas.delete_pizza(pizza)
      assert_raise Ecto.NoResultsError, fn -> Pizzas.get_pizza!(pizza.id) end
    end

    test "change_pizza/1 returns a pizza changeset" do
      pizza = pizza_fixture()
      assert %Ecto.Changeset{} = Pizzas.change_pizza(pizza)
    end
  end
end
