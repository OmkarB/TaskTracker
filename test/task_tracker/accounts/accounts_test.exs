defmodule TaskTracker.AccountsTest do
  use TaskTracker.DataCase

  alias TaskTracker.Accounts

  describe "users" do
    alias TaskTracker.Accounts.User

    @valid_attrs %{email: "some email", name: "some name"}
    @update_attrs %{email: "some updated email", name: "some updated name"}
    @invalid_attrs %{email: nil, name: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Accounts.create_user(@valid_attrs)
      assert user.email == "some email"
      assert user.name == "some name"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, user} = Accounts.update_user(user, @update_attrs)
      assert %User{} = user
      assert user.email == "some updated email"
      assert user.name == "some updated name"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end

  describe "managers" do
    alias TaskTracker.Accounts.Manager

    @valid_attrs %{email: "some email", manages: "some manages"}
    @update_attrs %{email: "some updated email", manages: "some updated manages"}
    @invalid_attrs %{email: nil, manages: nil}

    def manager_fixture(attrs \\ %{}) do
      {:ok, manager} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_manager()

      manager
    end

    test "list_managers/0 returns all managers" do
      manager = manager_fixture()
      assert Accounts.list_managers() == [manager]
    end

    test "get_manager!/1 returns the manager with given id" do
      manager = manager_fixture()
      assert Accounts.get_manager!(manager.id) == manager
    end

    test "create_manager/1 with valid data creates a manager" do
      assert {:ok, %Manager{} = manager} = Accounts.create_manager(@valid_attrs)
      assert manager.email == "some email"
      assert manager.manages == "some manages"
    end

    test "create_manager/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_manager(@invalid_attrs)
    end

    test "update_manager/2 with valid data updates the manager" do
      manager = manager_fixture()
      assert {:ok, manager} = Accounts.update_manager(manager, @update_attrs)
      assert %Manager{} = manager
      assert manager.email == "some updated email"
      assert manager.manages == "some updated manages"
    end

    test "update_manager/2 with invalid data returns error changeset" do
      manager = manager_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_manager(manager, @invalid_attrs)
      assert manager == Accounts.get_manager!(manager.id)
    end

    test "delete_manager/1 deletes the manager" do
      manager = manager_fixture()
      assert {:ok, %Manager{}} = Accounts.delete_manager(manager)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_manager!(manager.id) end
    end

    test "change_manager/1 returns a manager changeset" do
      manager = manager_fixture()
      assert %Ecto.Changeset{} = Accounts.change_manager(manager)
    end
  end
end
