defmodule UnfSwuber.Router do
  use UnfSwuber.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :with_session do
    plug Guardian.Plug.VerifySession
    plug Guardian.Plug.LoadResource
    plug UnfSwuber.CurrentUser
  end

  pipeline :login_required do
    plug Guardian.Plug.EnsureAuthenticated,
         handler: UnfSwuber.GuardianErrorHandler
  end

  pipeline :admin_required do
    plug UnfSwuber.CheckAdmin
  end

  # guest zone
  scope "/", UnfSwuber do
    pipe_through [:browser, :with_session]


    get "/", PageController, :index
    get "/chat", ChatController, :index
    resources "/sessions", SessionController, only: [:new, :create, :delete]

    resources "/users", UserController, only: [:new, :create]

    # registered user zone
    scope "/" do
      pipe_through [:login_required]

      resources "/users", UserController, only: [:show] do
        resources "/posts", PostController
      end

      # admin zone
      scope "/admin", Admin, as: :admin do
        pipe_through [:admin_required]

        resources "/users", UserController, only: [:index, :show] do
          resources "/posts", PostController, only: [:index, :show]
        end
      end
    end
  end
end
