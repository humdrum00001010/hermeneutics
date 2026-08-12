defmodule HermeneuticsWeb.PageController do
  use HermeneuticsWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
