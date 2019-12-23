defmodule LyricalElixir.Repo.Migrations.CreateSongs do
  use Ecto.Migration

  def change do
    create table(:songs) do
      add :title, :string

      timestamps()
    end

  end
end
