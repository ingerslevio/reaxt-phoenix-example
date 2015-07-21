defmodule ReaxtPhoenixExample.Router do
  use ReaxtPhoenixExample.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ReaxtPhoenixExample do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/with_stacktrace", PageController, :with_stacktrace
    get "/without_stacktrace", PageController, :without_stacktrace
    get "/subcomponent", PageController, :subcomponent
    get "/myrouter/*_rest", PageController, :myrouter
    get "/public/*filename", PageController, :file
  end

  pipeline :webpack do
    plug WebPack.Plug.Static, at: "/public", from: :survey
  end

  scope "/webpack", Survey do
    pipe_through :webpack

    get "/stats.json", WebpackController, :stats
    get "/", WebpackController, :index
    get "/events", WebpackController, :events
    get "/client.js", WebpackController, :client
    get "/static/:name", WebpackController, :file
  end

  # Other scopes may use custom stacks.
  # scope "/api", ReaxtPhoenixExample do
  #   pipe_through :api
  # end
end
