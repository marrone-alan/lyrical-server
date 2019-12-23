defmodule LyricalElixir.Lyrical.Lyric do
  use Ecto.Schema
  import Ecto.Changeset

  schema "lyrics" do
    field :content, :string
    field :likes, :integer
    belongs_to :song, LyricalElixir.Lyrical.Song
    timestamps()
  end

  @doc false
  def changeset(lyric, attrs) do
    lyric
    |> cast(attrs, [:likes, :content])
    |> validate_required([:content])
  end
end
