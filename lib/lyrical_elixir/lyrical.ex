defmodule LyricalElixir.Lyrical do
  @moduledoc """
  The Lyrical context.
  """

  import Ecto.Query, warn: false
  alias LyricalElixir.Repo

  alias LyricalElixir.Lyrical.Lyric

  @doc """
  Returns the list of lyrics.

  ## Examples

      iex> list_lyrics()
      [%Lyric{}, ...]

  """
  def list_lyrics do
    Repo.all(Lyric)
  end

  @doc """
  Gets a single lyric.

  Raises `Ecto.NoResultsError` if the Lyric does not exist.

  ## Examples

      iex> get_lyric!(123)
      %Lyric{}

      iex> get_lyric!(456)
      ** (Ecto.NoResultsError)

  """
  def get_lyric!(id), do: Repo.get!(Lyric, id)

  @doc """
  Creates a lyric.

  ## Examples

      iex> create_lyric(%{field: value})
      {:ok, %Lyric{}}

      iex> create_lyric(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_lyric(attrs \\ %{}, song) do
    song
    |> Ecto.build_assoc(:lyrics)
    |> Lyric.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a lyric.

  ## Examples

      iex> update_lyric(lyric, %{field: new_value})
      {:ok, %Lyric{}}

      iex> update_lyric(lyric, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_lyric(%Lyric{} = lyric, attrs) do
    lyric
    |> Lyric.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Lyric.

  ## Examples

      iex> delete_lyric(lyric)
      {:ok, %Lyric{}}

      iex> delete_lyric(lyric)
      {:error, %Ecto.Changeset{}}

  """
  def delete_lyric(%Lyric{} = lyric) do
    Repo.delete(lyric)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking lyric changes.

  ## Examples

      iex> change_lyric(lyric)
      %Ecto.Changeset{source: %Lyric{}}

  """
  def change_lyric(%Lyric{} = lyric) do
    Lyric.changeset(lyric, %{})
  end

  alias LyricalElixir.Lyrical.Song

  @doc """
  Returns the list of songs.

  ## Examples

      iex> list_songs()
      [%Song{}, ...]

  """
  def list_songs do
    Repo.all(Song)
    |> Repo.preload(lyrics: [:song])
  end

  @doc """
  Gets a single song.

  Raises `Ecto.NoResultsError` if the Song does not exist.

  ## Examples

      iex> get_song!(123)
      %Song{}

      iex> get_song!(456)
      ** (Ecto.NoResultsError)

  """
  def get_song!(id) do
    Repo.get!(Song, id)
    |> Repo.preload(lyrics: [:song])
  end

  @doc """
  Creates a song.

  ## Examples

      iex> create_song(%{field: value})
      {:ok, %Song{}}

      iex> create_song(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_song(attrs \\ %{}) do
    %Song{}
    |> Song.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a song.

  ## Examples

      iex> update_song(song, %{field: new_value})
      {:ok, %Song{}}

      iex> update_song(song, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_song(%Song{} = song, attrs) do
    song
    |> Song.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Song.

  ## Examples

      iex> delete_song(song)
      {:ok, %Song{}}

      iex> delete_song(song)
      {:error, %Ecto.Changeset{}}

  """
  def delete_song(%Song{} = song) do
    Repo.delete(song)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking song changes.

  ## Examples

      iex> change_song(song)
      %Ecto.Changeset{source: %Song{}}

  """
  def change_song(%Song{} = song) do
    Song.changeset(song, %{})
  end
end
