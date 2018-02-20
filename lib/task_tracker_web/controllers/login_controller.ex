# From Nat's Notes
defmodule TaskTrackerWeb.LoginController do
  use TaskTrackerWeb, :controller

  alias TaskTracker.Accounts
  alias TaskTracker.Accounts.User

  def create(conn, %{"email" => email}) do
  	user = Accounts.get_user_email(email)
  	if user do
  		conn
  		|> put_session(:user_id, user.id)
  		|> redirect(to: task_path(conn, :index))
  	 else
  	 	conn
  	 	|> redirect(to: page_path(conn, :index))
  	 end
  end

  def delete(conn, _params) do
  	conn
  	|> delete_session(:user_id)
  	|> redirect(to: page_path(conn, :index))
  end
end