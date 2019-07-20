defmodule Server.Routers.ApiRouter do
  use Plug.Router
  require Plug.Conn

  plug :match
  plug :dispatch

  get "/" do
    conn
    |> Plug.Conn.put_resp_content_type( "application/json" )
    |> Plug.Conn.put_resp_header( "server", "" )
    |> Plug.Conn.resp( 200, Poison.encode!(%{ "hello" => "world" }))
    |> Plug.Conn.send_resp( )
  end

  match _ do
    Plug.Conn.send_resp( conn, 404, "Not Found" )
  end
end