defmodule LyricalElixirWeb.Router do
  use LyricalElixirWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api" do
    pipe_through :api

    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: LyricalElixirWeb.Schema

    forward "/", Absinthe.Plug,
      schema: LyricalElixirWeb.Schema

  end
  
  scope "/show", LyricalElixirWeb do
    pipe_through [:api]

    get "/songs", PageController, :show
  end

end
