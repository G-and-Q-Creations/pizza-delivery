defmodule PizzaDelivery.RestaurantsTest do
  use PizzaDelivery.DataCase

  alias PizzaDelivery.Restaurants

  describe "restaurants" do
    alias PizzaDelivery.Restaurants.Restaurant

    import PizzaDelivery.RestaurantsFixtures

    @invalid_attrs %{description: nil, name: nil, phone: nil, slug: nil, website: nil, address: nil}

    test "list_restaurants/0 returns all restaurants" do
      restaurant = restaurant_fixture()
      assert Restaurants.list_restaurants() == [restaurant]
    end

    test "get_restaurant!/1 returns the restaurant with given id" do
      restaurant = restaurant_fixture()
      assert Restaurants.get_restaurant!(restaurant.id) == restaurant
    end

    test "create_restaurant/1 with valid data creates a restaurant" do
      valid_attrs = %{description: "some description", name: "some name", phone: "some phone", slug: "some slug", website: "some website", address: "some address"}

      assert {:ok, %Restaurant{} = restaurant} = Restaurants.create_restaurant(valid_attrs)
      assert restaurant.description == "some description"
      assert restaurant.name == "some name"
      assert restaurant.phone == "some phone"
      assert restaurant.slug == "some slug"
      assert restaurant.website == "some website"
      assert restaurant.address == "some address"
    end

    test "create_restaurant/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Restaurants.create_restaurant(@invalid_attrs)
    end

    test "update_restaurant/2 with valid data updates the restaurant" do
      restaurant = restaurant_fixture()
      update_attrs = %{description: "some updated description", name: "some updated name", phone: "some updated phone", slug: "some updated slug", website: "some updated website", address: "some updated address"}

      assert {:ok, %Restaurant{} = restaurant} = Restaurants.update_restaurant(restaurant, update_attrs)
      assert restaurant.description == "some updated description"
      assert restaurant.name == "some updated name"
      assert restaurant.phone == "some updated phone"
      assert restaurant.slug == "some updated slug"
      assert restaurant.website == "some updated website"
      assert restaurant.address == "some updated address"
    end

    test "update_restaurant/2 with invalid data returns error changeset" do
      restaurant = restaurant_fixture()
      assert {:error, %Ecto.Changeset{}} = Restaurants.update_restaurant(restaurant, @invalid_attrs)
      assert restaurant == Restaurants.get_restaurant!(restaurant.id)
    end

    test "delete_restaurant/1 deletes the restaurant" do
      restaurant = restaurant_fixture()
      assert {:ok, %Restaurant{}} = Restaurants.delete_restaurant(restaurant)
      assert_raise Ecto.NoResultsError, fn -> Restaurants.get_restaurant!(restaurant.id) end
    end

    test "change_restaurant/1 returns a restaurant changeset" do
      restaurant = restaurant_fixture()
      assert %Ecto.Changeset{} = Restaurants.change_restaurant(restaurant)
    end
  end
end
