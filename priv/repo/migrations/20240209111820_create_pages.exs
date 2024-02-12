defmodule Project1.Repo.Migrations.CreatePages do
  use Ecto.Migration

  def change do
    create table(:pages) do

      timestamps(type: :utc_datetime)
    end
  end
end
