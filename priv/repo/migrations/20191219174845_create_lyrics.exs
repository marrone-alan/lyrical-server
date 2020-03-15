defmodule LyricalElixir.Repo.Migrations.CreateLyrics do
  use Ecto.Migration

  def change do
    create table(:lyrics) do
      add :likes, :integer, default: 0
      add :content, :string

      timestamps()
    end

  end
end
