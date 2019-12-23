defmodule LyricalElixirWeb.Resolvers.Songs do

  def list_songs(_parent, _args, _resolution) do
    {:ok, LyricalElixir.Lyrical.list_songs()}
  end

  def get_song(_parent, %{:id => id}, _resolution) do
    {:ok, LyricalElixir.Lyrical.get_song!(id)}
  end

  def create_song(_parent, args, _resolution) do
    case LyricalElixir.Lyrical.create_song(args) do
      {:ok, song} ->
        {:ok, song}
      _error ->
        {:error, "could not create song"}
    end
  end

  def delete_song(_parent, %{:id => id}, _resolution) do
    song = LyricalElixir.Lyrical.get_song!(id)
    case LyricalElixir.Lyrical.delete_song(song) do
      {:ok, song} ->
        {:ok, song}
      _error ->
        {:error, "could not delete song"}
    end
  end
end