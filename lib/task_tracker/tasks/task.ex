defmodule TaskTracker.Tasks.Task do
  use Ecto.Schema
  import Ecto.Changeset
  alias TaskTracker.Tasks.Task


  schema "tasks" do
    field :subject, :string
    field :body, :string
    field :assignee, :string
    field :time_worked, :integer
    field :completed, :boolean, default: false

    timestamps()
  end

  @doc false
  def changeset(%Task{} = task, attrs) do
    task
    |> cast(attrs, [:subject, :body, :assignee, :time_worked, :completed])
    |> validate_required([:subject, :body, :assignee, :time_worked, :completed])
  end

end
