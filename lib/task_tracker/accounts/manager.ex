defmodule TaskTracker.Accounts.Manager do
  use Ecto.Schema
  import Ecto.Changeset
  alias TaskTracker.Accounts.Manager


  schema "managers" do
    field :email, :string
    field :manages, :string

    timestamps()
  end

  @doc false
  def changeset(%Manager{} = manager, attrs) do
    manager
    |> cast(attrs, [:email, :manages])
    |> validate_required([:email, :manages])
  end
end
