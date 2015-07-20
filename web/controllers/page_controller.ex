defmodule ReaxtPhoenixExample.PageController do
  use ReaxtPhoenixExample.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
