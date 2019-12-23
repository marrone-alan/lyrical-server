defmodule LyricalElixir.LyricalTest do
  use LyricalElixir.DataCase

  alias LyricalElixir.Lyrical

  describe "lyrics" do
    alias LyricalElixir.Lyrical.Lyric

    @valid_attrs %{content: "some content", likes: 42}
    @update_attrs %{content: "some updated content", likes: 43}
    @invalid_attrs %{content: nil, likes: nil}

    def lyric_fixture(attrs \\ %{}) do
      {:ok, lyric} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Lyrical.create_lyric()

      lyric
    end

    test "list_lyrics/0 returns all lyrics" do
      lyric = lyric_fixture()
      assert Lyrical.list_lyrics() == [lyric]
    end

    test "get_lyric!/1 returns the lyric with given id" do
      lyric = lyric_fixture()
      assert Lyrical.get_lyric!(lyric.id) == lyric
    end

    test "create_lyric/1 with valid data creates a lyric" do
      assert {:ok, %Lyric{} = lyric} = Lyrical.create_lyric(@valid_attrs)
      assert lyric.content == "some content"
      assert lyric.likes == 42
    end

    test "create_lyric/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Lyrical.create_lyric(@invalid_attrs)
    end

    test "update_lyric/2 with valid data updates the lyric" do
      lyric = lyric_fixture()
      assert {:ok, %Lyric{} = lyric} = Lyrical.update_lyric(lyric, @update_attrs)
      assert lyric.content == "some updated content"
      assert lyric.likes == 43
    end

    test "update_lyric/2 with invalid data returns error changeset" do
      lyric = lyric_fixture()
      assert {:error, %Ecto.Changeset{}} = Lyrical.update_lyric(lyric, @invalid_attrs)
      assert lyric == Lyrical.get_lyric!(lyric.id)
    end

    test "delete_lyric/1 deletes the lyric" do
      lyric = lyric_fixture()
      assert {:ok, %Lyric{}} = Lyrical.delete_lyric(lyric)
      assert_raise Ecto.NoResultsError, fn -> Lyrical.get_lyric!(lyric.id) end
    end

    test "change_lyric/1 returns a lyric changeset" do
      lyric = lyric_fixture()
      assert %Ecto.Changeset{} = Lyrical.change_lyric(lyric)
    end
  end

  describe "songs" do
    alias LyricalElixir.Lyrical.Song

    @valid_attrs %{title: "some title"}
    @update_attrs %{title: "some updated title"}
    @invalid_attrs %{title: nil}

    def song_fixture(attrs \\ %{}) do
      {:ok, song} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Lyrical.create_song()

      song
    end

    test "list_songs/0 returns all songs" do
      song = song_fixture()
      assert Lyrical.list_songs() == [song]
    end

    test "get_song!/1 returns the song with given id" do
      song = song_fixture()
      assert Lyrical.get_song!(song.id) == song
    end

    test "create_song/1 with valid data creates a song" do
      assert {:ok, %Song{} = song} = Lyrical.create_song(@valid_attrs)
      assert song.title == "some title"
    end

    test "create_song/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Lyrical.create_song(@invalid_attrs)
    end

    test "update_song/2 with valid data updates the song" do
      song = song_fixture()
      assert {:ok, %Song{} = song} = Lyrical.update_song(song, @update_attrs)
      assert song.title == "some updated title"
    end

    test "update_song/2 with invalid data returns error changeset" do
      song = song_fixture()
      assert {:error, %Ecto.Changeset{}} = Lyrical.update_song(song, @invalid_attrs)
      assert song == Lyrical.get_song!(song.id)
    end

    test "delete_song/1 deletes the song" do
      song = song_fixture()
      assert {:ok, %Song{}} = Lyrical.delete_song(song)
      assert_raise Ecto.NoResultsError, fn -> Lyrical.get_song!(song.id) end
    end

    test "change_song/1 returns a song changeset" do
      song = song_fixture()
      assert %Ecto.Changeset{} = Lyrical.change_song(song)
    end
  end
end
