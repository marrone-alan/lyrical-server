defmodule LyricalElixirWeb.Schema do
  use Absinthe.Schema
  import_types LyricalElixirWeb.Schema.SongTypes
  import_types LyricalElixirWeb.Schema.LyricTypes

  alias LyricalElixirWeb.Resolvers

  query do

    @desc "Get all songs"
    field :songs, list_of(:song) do
      resolve &Resolvers.Songs.list_songs/3
    end

    @desc "Get song by id"
    field :song, :song do
      arg :id, non_null(:id)
      resolve &Resolvers.Songs.get_song/3
    end

    @desc "Get lyric by id"
    field :lyric, :lyric do
      arg :id, non_null(:id)
      resolve &Resolvers.Lyrics.get_lyric/3
    end
  end

  mutation do
    field :add_song, :song do
      arg :title, non_null(:string)

      resolve &Resolvers.Songs.create_song/3
    end

    field :delete_song, :song do
      arg :id, non_null(:id)

      resolve &Resolvers.Songs.delete_song/3
    end

    field :add_lyrics_to_song, :lyric do
      arg :id, non_null(:id)
      arg :content, non_null(:string)

      resolve &Resolvers.Lyrics.create_lyric/3
    end

    field :like_lyric, :lyric do
      arg :id, non_null(:id)

      resolve &Resolvers.Lyrics.like_lyric/3
    end
  end

end