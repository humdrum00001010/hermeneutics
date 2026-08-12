defmodule HermeneuticsWeb.PageControllerTest do
  use HermeneuticsWeb.ConnCase
  import Phoenix.LiveViewTest

  test "GET /", %{conn: conn} do
    {:ok, view, html} = live(conn, ~p"/")

    # One LiveView root containing both panels
    assert has_element?(view, "#panel-root")
    assert has_element?(view, "#left")
    assert has_element?(view, "#right")

    # The single data-phx-session lives on the root, not on each panel
    assert html =~ "data-phx-session"

    # Each panel has its own live event, updating its own counter
    view |> element("#left-increment") |> render_click()
    assert has_element?(view, "#left-count", "1")
    assert has_element?(view, "#right-count", "0")

    view |> element("#right-increment") |> render_click()
    assert has_element?(view, "#right-count", "1")
    assert has_element?(view, "#left-count", "1")
  end
end
