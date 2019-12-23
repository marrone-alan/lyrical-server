defmodule LyricalElixirWeb.Resolvers.Lyrics do

  def list_lyrics(_parent, _args, _resolution) do
    {:ok, LyricalElixir.Lyrical.list_songs()}
  end

  def create_lyric(_parent, %{:id => id, :content => content}, _resolution) do
    song = LyricalElixir.Lyrical.get_song!(id)
    case LyricalElixir.Lyrical.create_lyric(%{:content => content}, song) do
      {:ok, lyric} ->
        {:ok, lyric}
      _error ->
        {:error, "could not create lyric"}
    end
  end

  def get_lyric(_parent, %{:id => id}, _resolution) do
    {:ok, LyricalElixir.Lyrical.get_lyric!(id)}
  end

  def like_lyric(_parent, %{:id => id}, _resolution) do
    lyric = LyricalElixir.Lyrical.get_lyric!(id)
    %LyricalElixir.Lyrical.Lyric{:likes => likes} = lyric
    likes = likes + 1
    case LyricalElixir.Lyrical.update_lyric(lyric, %{:likes => likes}) do
      {:ok, lyricUpdated} ->
        {:ok, lyricUpdated}
      _error ->
        {:error, "could not update lyric"}
    end
  end

end