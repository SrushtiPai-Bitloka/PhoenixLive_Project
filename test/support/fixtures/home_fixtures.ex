defmodule Project1.HomeFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Project1.Home` context.
  """

  @doc """
  Generate a page.
  """
  def page_fixture(attrs \\ %{}) do
    {:ok, page} =
      attrs
      |> Enum.into(%{

      })
      |> Project1.Home.create_page()

    page
  end
end
