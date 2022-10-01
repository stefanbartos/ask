defmodule AskWeb.PageController do
  use AskWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
