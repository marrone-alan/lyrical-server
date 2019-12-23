defmodule LyricalElixir.Lyrical.Song do
  use Ecto.Schema
  import Ecto.Changeset

  schema "songs" do
    field :title, :string
    has_many :lyrics, LyricalElixir.Lyrical.Lyric

    timestamps()
  end

  @doc false
  def changeset(song, attrs) do
    song
    |> cast(attrs, [:title])
    |> validate_required([:title])
  end
end
