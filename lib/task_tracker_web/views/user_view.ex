defmodule TaskTrackerWeb.UserView do
  use TaskTrackerWeb, :view
  import Ecto.Query

  def get_manager(current_user) do
  	TaskTrackerWeb.list_managers()
end
