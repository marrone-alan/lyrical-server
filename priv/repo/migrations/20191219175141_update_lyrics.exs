defmodule LyricalElixir.Repo.Migrations.UpdateLyrics do
  use Ecto.Migration

  def change do
    alter table("lyrics") do
      add :song_id, references(:songs)
    end
  end
end
