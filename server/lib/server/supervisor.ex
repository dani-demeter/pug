defmodule Server.Supervisor do
  use Application

  def start( _type, _args ) do
    children = [ 
      { 
        Plug.Cowboy,
        scheme: :http,
        plug: Server.Router,
        options: [ port: 8080 ]
      }
    ]
    opts = [ strategy: :one_for_one, name: Server.Supervisor ]
    { :ok, _  } = Supervisor.start_link( children, opts )
  end
end
