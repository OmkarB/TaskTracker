defmodule TaskTrackerWeb.Router do
  use TaskTrackerWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :get_user
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  #From nat's notes.
  def get_user(conn, _params) do
    user_id = get_session(conn, :user_id)
    user = TaskTracker.Accounts.get_user(user_id || -1)
    assign(conn, :current_user, user)
  end


  scope "/", TaskTrackerWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    resources "/users", UserController
    resources "/tasks", TaskController
    post "/login", LoginController, :create
    delete "/login", LoginController, :delete
  end

end
