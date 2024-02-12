defmodule Project1.Home.Page do
  use Ecto.Schema
  import Ecto.Changeset

  schema "pages" do


    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(page, attrs) do
    page
    |> cast(attrs, [])
    |> validate_required([])
  end
end
