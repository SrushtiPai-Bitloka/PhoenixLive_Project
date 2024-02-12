defmodule Project1.HomeTest do
  use Project1.DataCase

  alias Project1.Home

  describe "pages" do
    alias Project1.Home.Page

    import Project1.HomeFixtures

    @invalid_attrs %{}

    test "list_pages/0 returns all pages" do
      page = page_fixture()
      assert Home.list_pages() == [page]
    end

    test "get_page!/1 returns the page with given id" do
      page = page_fixture()
      assert Home.get_page!(page.id) == page
    end

    test "create_page/1 with valid data creates a page" do
      valid_attrs = %{}

      assert {:ok, %Page{} = page} = Home.create_page(valid_attrs)
    end

    test "create_page/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Home.create_page(@invalid_attrs)
    end

    test "update_page/2 with valid data updates the page" do
      page = page_fixture()
      update_attrs = %{}

      assert {:ok, %Page{} = page} = Home.update_page(page, update_attrs)
    end

    test "update_page/2 with invalid data returns error changeset" do
      page = page_fixture()
      assert {:error, %Ecto.Changeset{}} = Home.update_page(page, @invalid_attrs)
      assert page == Home.get_page!(page.id)
    end

    test "delete_page/1 deletes the page" do
      page = page_fixture()
      assert {:ok, %Page{}} = Home.delete_page(page)
      assert_raise Ecto.NoResultsError, fn -> Home.get_page!(page.id) end
    end

    test "change_page/1 returns a page changeset" do
      page = page_fixture()
      assert %Ecto.Changeset{} = Home.change_page(page)
    end
  end
end
