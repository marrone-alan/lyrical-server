defmodule LyricalElixirWeb.PageController do
  use LyricalElixirWeb, :controller

  alias LyricalElixir.Lyrical

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def show(conn, _params) do
    songs = Lyrical.list_songs()
    IO.inspect songs
    render(conn, "index.html")
  end
end
