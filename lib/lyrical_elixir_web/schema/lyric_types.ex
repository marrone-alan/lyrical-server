defmodule LyricalElixirWeb.Schema.LyricTypes do
  use Absinthe.Schema.Notation

  object :lyric do
    field :id, :id
    field :likes, :integer
    field :content, :string
    field :songs, list_of(:song)
  end
end