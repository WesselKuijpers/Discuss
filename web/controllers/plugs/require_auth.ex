defmodule Discuss.Plugs.RequireAuth do
  import Plug.Conn
  import Phoenix.Controller
  alias Discuss.Router.Helpers

  def init(_params) do
    # do nothing
  end

  def call(conn, _params) do
    if conn.assigns[:user] do
      conn
    else
      conn
      |> put_flash(:error, "Action Prevented: Authentication Required.")
      |> redirect(to: Helpers.topic_path(conn, :index))
      |> halt()
    end
  end
end