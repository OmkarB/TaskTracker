defmodule TaskTracker.Repo.Migrations.CreateManagers do
  use Ecto.Migration

  def change do
    create table(:managers) do
      add :email, :string
      add :manages, :string

      timestamps()
    end

  end
end
