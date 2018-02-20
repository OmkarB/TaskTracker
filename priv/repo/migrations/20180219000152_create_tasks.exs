defmodule TaskTracker.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :body, :text
      add :subject, :text, null: false
      add :assignee, :text, null: false
      add :time_worked, :integer, null: false
      add :completed, :boolean, null: false
      timestamps()
    end

  end
end
