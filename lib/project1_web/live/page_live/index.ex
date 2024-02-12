defmodule Project1Web.PageLive.Index do
  use Project1Web, :live_view

  alias Project1.Home
  alias Project1.Home.Page

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :pages, Home.list_pages())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Page")
    |> assign(:page, Home.get_page!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Page")
    |> assign(:page, %Page{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Pages")
    |> assign(:page, nil)
  end

  @impl true
  def handle_info({Project1Web.PageLive.FormComponent, {:saved, page}}, socket) do
    {:noreply, stream_insert(socket, :pages, page)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    page = Home.get_page!(id)
    {:ok, _} = Home.delete_page(page)

    {:noreply, stream_delete(socket, :pages, page)}
  end
end
