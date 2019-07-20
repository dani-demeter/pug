defmodule Server.Router do
  use Plug.Router
  require Plug.Conn

  plug Plug.Logger, log: :debug
  plug :match
  plug :dispatch

  forward "/api", to: Server.Routers.ApiRouter

  match _ do
    Plug.Conn.send_resp( conn, 404, "Not Found" )
  end
end