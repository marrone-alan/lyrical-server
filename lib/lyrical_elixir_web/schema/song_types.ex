defmodule LyricalElixirWeb.Schema.SongTypes do
  use Absinthe.Schema.Notation

  object :song do
    field :id, :id
    field :title, :string
    field :lyrics, list_of(:lyric)
  end
end